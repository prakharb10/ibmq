import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ibmq/backends/status/data/wss_data_provider.dart';
import 'package:ibmq/backends/status/model/backend_status_update.dart';
import 'package:ibmq/utils/talker.dart';

part 'backends_status_updates_event.dart';
part 'backends_status_updates_state.dart';
part 'backends_status_updates_bloc.freezed.dart';

class BackendsStatusUpdatesBloc
    extends Bloc<BackendsStatusUpdatesEvent, BackendsStatusUpdatesState> {
  final WssDataProvider _wssDataProvider;
  BackendsStatusUpdatesBloc({required WssDataProvider wssDataProvider})
      : _wssDataProvider = wssDataProvider,
        super(const _Initial()) {
    on<_Started>((event, emit) async {
      switch (await _wssDataProvider.getBackendsStatusUpdates().run()) {
        case Left(:final value):
          talker.debug(value);
          emit(const Connecting());
          break;
        case Right(:final value):
          await emit.forEach(
            value,
            onData: (data) {
              return switch (Option.tryCatch(() => BackendStatusUpdate.fromJson(
                  jsonDecode(utf8.decode(data))))) {
                Some(:final value) => Listening(value),
                None() => state,
              };
            },
            onError: (error, stackTrace) {
              talker.handle(error, stackTrace, 'Failed to get backend updates');
              return state;
            },
          );
      }
    });
  }
}
