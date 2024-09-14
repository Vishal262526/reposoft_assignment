import 'package:assignment/core/enums/fonts_enum.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final CustomFontFamily fontFamily;

  const CustomText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.fontFamily = CustomFontFamily.poppins,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style != null
          ? style?.copyWith(
              fontFamily: fontFamily.name,
            )
          : TextStyle(fontFamily: fontFamily.name),
      textAlign: textAlign,
    );
  }
}
