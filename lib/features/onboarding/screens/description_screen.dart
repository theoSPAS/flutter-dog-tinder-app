import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_event.dart';
import 'package:mips_project/blocs/onboarding/onboarding_state.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../helpers/sizes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class DescriptionScreen extends StatelessWidget {
  final TabController tabController;

  const DescriptionScreen({Key? key, required this.tabController})
      : super(key: key);

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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(text: 'Describe Yourself'),
                  CustomTextField(
                    hint: 'ENTER YOUR BIO',
                    onChanged: (value) {
                      context.read<OnBoardingBloc>().add(UpdateUser(
                          pet: state.pet.copyWith(description: value)));
                    },
                  ),
                  SizedBox(height: height(context) * 0.002),
                  const CustomTextHeader(text: 'Enter your breed?'),
                  CustomTextField(
                    hint: 'ENTER YOUR BREED',
                    onChanged: (value) {
                      context.read<OnBoardingBloc>().add(
                          UpdateUser(pet: state.pet.copyWith(breed: value)));
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 5,
                    selectedColor: Theme.of(context).primaryColorDark,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: height(context) * 0.02),
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
