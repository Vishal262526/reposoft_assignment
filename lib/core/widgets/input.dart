import 'package:assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  final TextEditingController controller;

  final String hintText;
  final IconData? prefixIcon;
  final TextInputType type;
  final bool securedTextEntry;

  const Input({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.type = TextInputType.text,
    this.securedTextEntry = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: securedTextEntry,
      keyboardType: type,
      controller: controller,
      style: TextStyle(fontSize: 18.sp),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon == null
            ? null
            : Icon(
                prefixIcon,
                size: 26,
                color: LightThemeColors.primaryDark,
              ),
      ),
    );
  }
}
