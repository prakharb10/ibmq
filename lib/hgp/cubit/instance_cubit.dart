import 'package:bloc/bloc.dart';

class InstanceCubit extends Cubit<String?> {
  InstanceCubit({String? instance}) : super(instance);

  void changeInstance(String? instance) {
    emit(instance);
  }
}
