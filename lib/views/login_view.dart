import 'package:assignment/controllers/auth_controller.dart';
import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:assignment/core/routes/route_name.dart';
import 'package:assignment/core/theme/colors.dart';
import 'package:assignment/core/widgets/button.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:assignment/core/widgets/input.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: "Sing In",
          fontFamily: CustomFontFamily.supermercadoOne,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280.h,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/login.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomText(
                text: "Welcome Back Ashutosh!",
                fontFamily: CustomFontFamily.supermercadoOne,
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  color: LightThemeColors.secondaryDark,
                ),
              ),
              Text(
                "Sign in to continue!",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: LightThemeColors.grayColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.r),
                ),
                color: kWhiteColor,
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 25,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Input(
                        type: TextInputType.emailAddress,
                        controller: _authController.loginEmailController,
                        hintText: "Email Address",
                        prefixIcon: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Input(
                        securedTextEntry: true,
                        controller: _authController.loginPasswordController,
                        hintText: "Password",
                        prefixIcon: Icons.lock,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Obx(
                                () => Checkbox(
                                  activeColor: LightThemeColors.primaryDark,
                                  checkColor: kWhiteColor,
                                  value:
                                      _authController.rememberMeIsChecked.value,
                                  onChanged: (value) {
                                    _authController.rememberMeIsChecked.value =
                                        value ??
                                            _authController
                                                .rememberMeIsChecked.value;
                                  },
                                ),
                              ),
                              Text(
                                "Rembmer Me",
                                style: TextStyle(
                                  color: LightThemeColors.grayColor,
                                  fontSize: 15.sp,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Forget Password ?",
                            style: TextStyle(
                              color: LightThemeColors.grayColor,
                              fontSize: 15.sp,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => Button(
                            isLoading: _authController.isLoading.value,
                            onTap: () {
                              _authController.login();
                            },
                            text: "Sign In",
                            hasFullWidth: true,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: _authController.isLoading.value
                            ? null
                            : () {
                                Get.toNamed(RouteName.signup);
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
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
