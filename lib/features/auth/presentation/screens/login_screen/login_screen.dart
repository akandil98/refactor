import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/config/routes/app_routes.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/extentions/if_debugging.dart';
import 'package:refactor/features/auth/presentation/widgets/default_button.dart';
import 'package:refactor/features/auth/presentation/widgets/default_form_field.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController(
      text: 'a.kandil.se@gmail.com'.ifDebuggin,
    );
    final passwordController = useTextEditingController(
      text: '123456'.ifDebuggin,
    );
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.login),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  DefaultTextFormField(
                    controller: emailController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email address';
                      }
                      return null;
                    },
                    label: AppStrings.email,
                    prefix: const Icon(Icons.email_outlined),
                  ),
                  SizedBox(height: 20.h),
                  DefaultTextFormField(
                    controller: passwordController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password is too short';
                      }
                      return null;
                    },
                    label: AppStrings.password,
                    prefix: const Icon(Icons.lock_outline),
                    isPassword: true,
                  ),
                  SizedBox(height: 20.h),
                  DefaultButton(
                    onPressed: () {
                      formKey.currentState!.validate();
                    },
                    child: const Text(AppStrings.login),
                  ),
                  SizedBox(height: 20.h),
                  DefaultButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.registerRoute);
                    },
                    child: const Text(AppStrings.notRegisteredYetRegisterHere),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
