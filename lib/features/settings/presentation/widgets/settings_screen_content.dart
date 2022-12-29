import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/config/routes/app_routes.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/auth/presentation/widgets/default_button.dart';
import 'package:refactor/features/auth/presentation/widgets/default_form_field.dart';
import 'package:refactor/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:refactor/injection.container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreenContent extends StatelessWidget {
  SettingsScreenContent({super.key});

  final sharedPreferences = di.sl<SharedPreferences>();
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>().userData!;
    nameController.text = cubit.name;
    emailController.text = cubit.email;
    phoneController.text = cubit.phone;
    return Center(
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
                      context.read<SettingsCubit>().updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                    }
                  },
                  child: const Text(AppStrings.update),
                ),
                SizedBox(height: 20.h),
                DefaultButton(
                  onPressed: () {
                    sharedPreferences.remove(AppStrings.token);
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: const Text(AppStrings.logout),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
