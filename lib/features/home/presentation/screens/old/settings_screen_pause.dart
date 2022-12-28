// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:refactor/core/utils/app_colors.dart';
// import 'package:refactor/core/widgets/error_screen.dart';
// import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
// import 'package:refactor/features/home/presentation/widgets/settings_screen_content.dart';

// class SettingsScreenPause extends StatefulWidget {
//   const SettingsScreenPause({super.key});

//   @override
//   State<SettingsScreenPause> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreenPause> {
//   _getSettingsData() => BlocProvider.of<HomeCubit>(context).getUserData();

//   @override
//   void initState() {
//     super.initState();
//     _getSettingsData();
//   }

//   Widget _buildBodyContent() {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         if (state is SettingsIsLoading) {
//           return const Center(
//             child: SpinKitFadingCircle(
//               color: AppColors.hint,
//             ),
//           );
//         } else if (state is SettingsError) {
//           return ErrorScreen(onPress: () => _getSettingsData());
//         } else if (state is SettingsLoaded) {
//           return SettingsScreenContent(
//             userEntity: state.userEntity,
//           );
//         } else {
//           return const Center(
//             child: SpinKitFadingCircle(
//               color: AppColors.hint,
//             ),
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       color: AppColors.hint,
//       onRefresh: () => _getSettingsData(),
//       child: _buildBodyContent(),
//     );
//   }
// }
