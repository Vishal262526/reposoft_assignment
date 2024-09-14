import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:assignment/core/widgets/custom_text.dart';
import 'package:assignment/core/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool hasFullWidth;
  final bool isLoading;

  const Button({
    super.key,
    required this.onTap,
    required this.text,
    this.hasFullWidth = false,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: hasFullWidth ? double.infinity : null,
      height: 60.h,
      child: FilledButton(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(19.0)),
          textStyle: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: isLoading ? null : onTap,
        child: isLoading
            ? const Loader(
                size: 20,
              )
            : CustomText(
                text: text,
                fontFamily: CustomFontFamily.supermercadoOne,
              ),
      ),
    );
  }
}
