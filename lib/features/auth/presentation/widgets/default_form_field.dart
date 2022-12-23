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
  final Widget? suffix;
  final bool? isClickable;
  final bool? isReadOnly;
  const DefaultTextFormField({
    Key? key,
    required this.controller,
    this.label,
    this.height = 40,
    this.width = double.infinity,
    this.textInputType,
    this.isPassword = false,
    this.validator,
    this.prefix,
    this.suffix,
    this.isClickable = true,
    this.isReadOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      validator: validator,
      obscureText: isPassword!,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: prefix,
        suffixIcon: suffix,
        border: const OutlineInputBorder(),
      ),
      readOnly: isReadOnly!,
    );
  }
}
