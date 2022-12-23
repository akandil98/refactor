import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_colors.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets padding;
  const DefaultButton({
    Key? key,
    this.text,
    this.child,
    required this.onPressed,
    this.color = AppColors.primary,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 40,
    this.fontSize = 16,
    this.fontWeight = FontWeight.bold,
    this.padding = const EdgeInsets.all(8),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: padding,
        ),
        child: child ??
            Center(
              child: Text(
                text ?? '',
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize.sp,
                  fontWeight: fontWeight,
                ),
              ),
            ),
      ),
    );
  }
}
