import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:example/services/attendance_service.dart';
import 'package:example/services/face_service.dart';
import 'package:meta/meta.dart';

part 'face_registration_state.dart';

class FaceRegistrationCubit extends Cubit<FaceRegistrationState> {
  FaceRegistrationCubit() : super(FaceRegistrationInitial());

  Future<void> register(
      {required List<File> images, required String name}) async {
    try {
      if (name.trim().isEmpty) {
        return;
      }
      emit(FaceRegistrationInProgress());

      final res = await FaceService.registerFace(images: images, name: name);
      await EmployeeService.registerEmployee(
          qdrantId: res['qdrant_id'].toString(), name: name);
      emit(FaceRegistrationSuccess(registrationData: res));
    } catch (e) {
      emit(FaceRegistrationFailed(e.toString()));
    }
  }
}
