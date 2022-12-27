import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:refactor/core/utils/app_strings.dart';
import 'package:refactor/features/auth/presentation/widgets/default_form_field.dart';
import 'package:refactor/features/home/presentation/cubit/home_cubit.dart';
import 'package:refactor/features/search/presentation/cubit/search_cubit.dart';
import 'package:refactor/features/search/presentation/widgets/search_screen_content.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  DefaultTextFormField(
                    controller: searchController,
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return AppStrings.searchProducts;
                      }
                      return null;
                    },
                    onSubmit: (text) {
                      context.read<SearchCubit>().search(text: text);
                    },
                    label: AppStrings.search,
                    prefix: const Icon(Icons.search),
                  ),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  if (state is SearchIsLoading) const LinearProgressIndicator(),
                  SizedBox(
                    height: 10.0.h,
                  ),
                  if (state is SearchLoaded)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              SearchScreenContent(index: index),
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: state.searchEntity.data.data.length),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
