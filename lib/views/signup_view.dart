import 'package:assignment/controllers/auth_controller.dart';
import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/core/widgets/button.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:assignment/core/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => SignupView());

  SignupView({super.key});

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: const CustomText(
          text: "Sign Up",
          fontFamily: CustomFontFamily.supermercadoOne,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0.r),
          padding: EdgeInsets.symmetric(horizontal: 16.r, vertical: 16.r),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(19.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 160.w,
                height: 160.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: LightThemeColors.secondaryLight2,
                  border: Border.all(color: kBlackColor, width: 0.4),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 80.w,
                  color: LightThemeColors.secondaryDark,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Input(
                    controller: _authController.signupNameController,
                    hintText: "Full Name",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    type: TextInputType.phone,
                    controller: _authController.signupPhoneController,
                    hintText: "Phone Number",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    type: TextInputType.emailAddress,
                    controller: _authController.signupEmailController,
                    hintText: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    securedTextEntry: true,
                    controller: _authController.signupPasswordController,
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Input(
                    securedTextEntry: true,
                    controller: _authController.signupConfirmPasswordController,
                    hintText: "Confirm Password",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        activeColor: LightThemeColors.primaryDark,
                        checkColor: kWhiteColor,
                        value: _authController.termsAndConditionIsChecked.value,
                        onChanged: (value) {
                          _authController.termsAndConditionIsChecked.value =
                              value ??
                                  _authController
                                      .termsAndConditionIsChecked.value;
                        },
                      ),
                      Expanded(
                        child: Text(
                          "By creating an account you agree to our terms of service and privacy policy",
                          style: TextStyle(
                            color: LightThemeColors.grayColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Obx(() => Button(
                        isLoading: _authController.isLoading.value,
                        onTap: () {
                          _authController.signUp();
                        },
                        text: "Sign Up",
                        hasFullWidth: true,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Create a new account",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: LightThemeColors.secondaryLight,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
