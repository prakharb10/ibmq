import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/data/runtime_data_provider.dart';
import 'package:ibmq/user/jobs_updates/model/job_status_update.dart';
import 'package:ibmq/utils/talker.dart';

part 'user_jobs_updates_event.dart';
part 'user_jobs_updates_state.dart';
part 'user_jobs_updates_bloc.freezed.dart';

class UserJobsUpdatesBloc
    extends Bloc<UserJobsUpdatesEvent, UserJobsUpdatesState> {
  final RuntimeDataProvider _runtimeDataProvider;
  UserJobsUpdatesBloc({required RuntimeDataProvider runtimeDataProvider})
      : _runtimeDataProvider = runtimeDataProvider,
        super(const _Initial()) {
    on<_Started>((event, emit) async {
      switch (await _runtimeDataProvider.getUserJobsStateUpdates().run()) {
        case Left(:final value):
          talker.debug(value);
          emit(const Connecting());
          break;
        case Right(:final value):
          await emit.forEach(
            value,
            onData: (data) {
              return switch (Option.tryCatch(
                  () => JobStatusUpdate.fromJson(jsonDecode(data)))) {
                Some(:final value) => Listening(value),
                None() => state,
              };
            },
            onError: (error, stackTrace) {
              talker.handle(error, stackTrace, 'Failed to get job updates');
              return state;
            },
          );
      }
    });
  }
}
