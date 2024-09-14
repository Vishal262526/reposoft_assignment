import 'package:assignment/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loader extends StatelessWidget {
  final Color color;
  final double? size;

  const Loader({
    super.key,
    this.color = LightThemeColors.primaryDark,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.w,
      height: size?.h,
      child: CircularProgressIndicator(
        color: color,
      ),
    );
  }
}
