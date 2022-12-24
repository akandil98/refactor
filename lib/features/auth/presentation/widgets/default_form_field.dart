import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_colors.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final double? height;
  final double? width;
  final TextInputType? textInputType;
  final bool? isPassword;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final IconData? suffix;
  final Function? suffixPressed;
  final bool? isClickable;
  final bool? isReadOnly;
  const DefaultTextFormField({
    Key? key,
    required this.controller,
    this.label,
    this.height = 50,
    this.width = double.infinity,
    this.textInputType,
    this.isPassword = false,
    this.validator,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height!.h,
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        validator: validator,
        obscureText: isPassword!,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(10),
          labelText: label,
          prefix: prefix,
          suffix: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(suffix),
                )
              : null,
          border: const OutlineInputBorder(),
        ),
        readOnly: isReadOnly!,
      ),
    );
  }
}
