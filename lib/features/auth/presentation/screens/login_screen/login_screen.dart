import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/config/routes/app_routes.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/utils/constants.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/extentions/if_debugging.dart';
import 'package:refactor/features/auth/presentation/cubit/auth_cubit.dart';
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

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoginSuccess) {
          Constants.showToast(msg: AppStrings.loggedInSuccessfully);
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
        if (state is AuthError) {
          Constants.showErrorDialog(context: context, msg: state.msg);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.login),
          ),
          body: state is AuthIsLoading
              ? const Center(
                  child: SpinKitFadingCircle(
                    color: AppColors.primary,
                  ),
                )
              : Center(
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
                                  return AppStrings.pleaseEnterYourEmailAddress;
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
                                  return AppStrings.passwordIsTooShort;
                                }
                                return null;
                              },
                              label: AppStrings.password,
                              suffix: context.read<AuthCubit>().suffix,
                              prefix: const Icon(Icons.lock_outline),
                              isPassword: context.read<AuthCubit>().isPassword,
                              suffixPressed: () {
                                context
                                    .read<AuthCubit>()
                                    .changePasswordVisibility();
                              },
                            ),
                            SizedBox(height: 20.h),
                            DefaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                }
                              },
                              child: const Text(AppStrings.login),
                            ),
                            SizedBox(height: 20.h),
                            DefaultButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.registerRoute);
                              },
                              child: const Text(
                                  AppStrings.notRegisteredYetRegisterHere),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}
