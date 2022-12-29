import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:refactor/core/utils/app_colors.dart';
import 'package:refactor/core/widgets/error_screen.dart';
import 'package:refactor/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:refactor/features/settings/presentation/widgets/settings_screen_content.dart';

class SettingsScreen extends HookWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBodyContent();
  }

  Widget _buildBodyContent() {
    return BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
      if (state is SettingsIsLoading) {
        return const Center(
          child: SpinKitFadingCircle(
            color: AppColors.hint,
          ),
        );
      } else if (state is SettingsError) {
        return ErrorScreen(
            onPress: () => context.read<SettingsCubit>().getUserData());
      } else if (context.read<SettingsCubit>().userData == null) {
        return ErrorScreen(
            onPress: () => context.read<SettingsCubit>().getUserData());
      } else {
        return SettingsScreenContent();
      }
    });
  }
}
