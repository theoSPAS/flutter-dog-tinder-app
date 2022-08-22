import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_event.dart';
import 'package:mips_project/blocs/onboarding/onboarding_state.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_checkbox.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class DemographicsScreen extends StatelessWidget {
  final TabController tabController;

  const DemographicsScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
      if (state is OnBoardingLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is OnBoardingLoaded) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(text: 'What\'s Your Gender?'),
                  CustomCheckbox(
                    text: 'MALE',
                    value: state.pet.gender == 'Male',
                    onChanged: (bool? newValue) {
                      context.read<OnBoardingBloc>().add(UpdateUser(
                          pet: state.pet.copyWith(gender: 'Male')));
                    },
                  ),
                  CustomCheckbox(
                    text: 'FEMALE',
                    value: state.pet.gender == 'Female',
                    onChanged: (bool? newValue) {
                      context.read<OnBoardingBloc>().add(UpdateUser(
                          pet: state.pet.copyWith(gender: 'Female')));
                    },
                  ),
                  SizedBox(height: height(context) * 0.002),
                  const CustomTextHeader(text: 'What\'s Your Age?'),
                  CustomTextField(
                    hint: 'ENTER YOUR AGE',
                    onChanged: (value) {
                      context.read<OnBoardingBloc>().add(UpdateUser(
                          pet: state.pet.copyWith(age: int.parse(value))));
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 3,
                    selectedColor: Theme.of(context).primaryColorDark,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  const SizedBox(height: 10),
                  CustomButton(tabController: tabController, text: 'NEXT STEP'),
                ],
              ),
            ],
          ),
        );
      } else {
        return const Text('Something went wrong.');
      }
    });
  }
}
