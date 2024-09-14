import 'dart:async';

import 'package:assignment/core/exceptions.dart';
import 'package:assignment/core/routes/route_name.dart';
import 'package:assignment/core/utils/app_utils.dart';
import 'package:assignment/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthServices extends GetxService {
  final _authRepository = AuthRepository();

  StreamSubscription<User?>? _authStream;

  final user = Rx<User?>(null);

  @override
  void onReady() {
    _authStream = _authRepository.onAuthStateChange.listen(
      (authUser) {
        user.value = authUser;
        if (authUser != null) {
          Get.offAllNamed(RouteName.home);
        } else {
          Get.offAllNamed(RouteName.login);
        }
      },
    );
    super.onReady();
  }

  void signOut() async {
    try {
      await _authRepository.signOut();
    } on CustomException catch (e) {
      AppUtils.showSnackBar(type: "Errror", errorMessage: e.message);
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _authStream?.cancel();
    super.onClose();
  }
}
