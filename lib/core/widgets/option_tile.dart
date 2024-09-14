import 'package:assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OptionTile extends StatelessWidget {
  final String label;
  final Object value;
  final Object selectedValue;
  final Function(Object? value) onChange;

  const OptionTile({
    super.key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      activeColor: LightThemeColors.primaryDark,
      // tileColor: Colors.red,

      contentPadding: EdgeInsets.zero,
      title: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.r),
          color: LightThemeColors.primaryLight,
        ),
        height: 50.h,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            color: value == selectedValue
                ? LightThemeColors.primaryDark
                : const Color(0xFF7D7D7D),
          ),
        ),
      ),
      value: value,
      groupValue: selectedValue,
      onChanged: onChange,
    );
  }
}
