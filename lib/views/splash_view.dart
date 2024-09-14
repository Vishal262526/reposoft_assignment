import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomText(
          text: "Welcome",
          fontFamily: CustomFontFamily.supermercadoOne,
          style: TextStyle(
            fontSize: 50.sp,
          ),
        ),
      ),
    );
  }
}
