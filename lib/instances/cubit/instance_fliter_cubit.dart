import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';

class InstanceFilterCubit extends Cubit<Option<String>> {
  InstanceFilterCubit({Option<String> instance = const Option.none()})
      : super(instance);

  void changeInstance(String? instance) {
    emit(Option.fromNullable(instance));
  }
}
