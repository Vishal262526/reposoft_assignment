import 'package:assignment/core/exceptions.dart';
import 'package:assignment/core/utils/app_utils.dart';
import 'package:assignment/models/user_model.dart';
import 'package:assignment/repository/auth_repository.dart';
import 'package:assignment/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _authRepository = AuthRepository();

  final isLoading = false.obs;
  final rememberMeIsChecked = false.obs;
  final termsAndConditionIsChecked = false.obs;

  final _authServices = Get.find<AuthServices>();

  // Sign Up Input Controllers
  final signupNameController = TextEditingController();
  final signupPhoneController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();

  // Log In Input Controller
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Reset all the inputs
  void resetAllInputs() {
    signupNameController.clear();
    signupPhoneController.clear();
    signupEmailController.clear();
    signupPasswordController.clear();
    signupConfirmPasswordController.clear();
  }

  void login() async {
    if (loginEmailController.text.trim().isEmpty ||
        loginPasswordController.text.trim().isEmpty) {
      AppUtils.showSnackBar(
          type: "Validation Error", errorMessage: "All Fields are required");
      return;
    }
    isLoading.value = true;
    try {
      await _authRepository.login(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
    } on CustomException catch (e) {
      AppUtils.showSnackBar(type: "Error", errorMessage: e.message);
    } finally {
      isLoading.value = false;
    }
  }

  void signUp() async {
    if (!termsAndConditionIsChecked.value) {
      AppUtils.showSnackBar(
        type: "Validation Error",
        errorMessage: "Please Accept Terms & Conditions to continue",
      );
      return;
    }

    if (signupNameController.text.trim().isEmpty ||
        signupPhoneController.text.trim().isEmpty ||
        signupEmailController.text.trim().isEmpty ||
        signupPasswordController.text.trim().isEmpty ||
        signupConfirmPasswordController.text.trim().isEmpty) {
      AppUtils.showSnackBar(
          type: "Validation Error", errorMessage: "All Fields are required");
      return;
    }

    if (signupPasswordController.text.trim() !=
        signupConfirmPasswordController.text.trim()) {
      AppUtils.showSnackBar(
          type: "Validation Error", errorMessage: "Confirm Password not match");
      return;
    }

    isLoading.value = true;
    try {
      // Register a new user and it will return a UID
      final uid = await _authRepository.signUp(
        email: signupEmailController.text.trim(),
        password: signupPasswordController.text.trim(),
      );

      // Create a user data model
      final user = UserModel(
        uid: uid,
        name: signupNameController.text.trim(),
        email: signupEmailController.text.trim(),
        phoneNumber: signupPhoneController.text.trim(),
      );

      // after successfully register update the user data
      _authRepository.updateUserData(user: user);
    } on CustomException catch (e) {
      AppUtils.showSnackBar(type: "Error", errorMessage: e.message);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    // Dispose all the input controller when controller is lost from the memory
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPhoneController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();

    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.onClose();
  }
}
