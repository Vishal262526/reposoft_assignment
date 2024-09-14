import 'package:assignment/core/theme/colors.dart';
import 'package:get/get.dart';

class AppUtils {
  static void showSnackBar(
      {required String type, required String errorMessage}) {
    Get.snackbar(
      type,
      errorMessage,
      backgroundColor: LightThemeColors.primaryDark,
      colorText: kWhiteColor,
    );
  }
}
