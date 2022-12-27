import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final Function(String)? onSubmit;
  const DefaultTextFormField({
    Key? key,
    required this.controller,
    this.label,
    this.height = 60,
    this.width = double.infinity,
    this.textInputType,
    this.isPassword = false,
    this.validator,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
    this.isReadOnly = false,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height!.h,
      child: TextFormField(
        cursorColor: Colors.black,
        controller: controller,
        keyboardType: textInputType,
        validator: validator,
        obscureText: isPassword!,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          prefixIcon: prefix,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black)),
          labelStyle: const TextStyle(color: Colors.black),
          contentPadding: const EdgeInsets.all(10),
          labelText: label,
          suffixIcon: suffix != null
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
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}
