import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/config/routes/app_routes.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/core/utils/constants.dart';
import 'package:refactor/extentions/if_debugging.dart';
import 'package:refactor/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:refactor/features/auth/presentation/widgets/default_button.dart';
import 'package:refactor/features/auth/presentation/widgets/default_form_field.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(
      text: 'Abdelrahman Kandil'.ifDebuggin,
    );
    final emailController = useTextEditingController(
      text: '@gmail.com'.ifDebuggin,
    );
    final passwordController = useTextEditingController(
      text: '123456'.ifDebuggin,
    );
    final phoneController = useTextEditingController(
      text: ''.ifDebuggin,
    );
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthRegisterSuccess) {
          Constants.showToast(msg: AppStrings.registeredSuccessfully);
          Navigator.pushReplacementNamed(context, Routes.homeRoute);
        }
        if (state is AuthError) {
          Constants.showErrorDialog(context: context, msg: state.msg);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.register),
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
                              controller: nameController,
                              textInputType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourName;
                                }
                                return null;
                              },
                              label: AppStrings.name,
                              prefix: const Icon(Icons.person),
                            ),
                            SizedBox(height: 20.h),
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
                            DefaultTextFormField(
                              controller: phoneController,
                              textInputType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return AppStrings.pleaseEnterYourPhone;
                                }
                                return null;
                              },
                              label: AppStrings.phone,
                              prefix: const Icon(Icons.phone),
                            ),
                            SizedBox(height: 20.h),
                            DefaultButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<AuthCubit>().register(
                                        name: nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                      );
                                }
                              },
                              child: const Text(AppStrings.register),
                            ),
                            SizedBox(height: 20.h),
                            DefaultButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, Routes.loginRoute);
                              },
                              child: const Text(
                                  AppStrings.alreadyRegisteredLoginHere),
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
