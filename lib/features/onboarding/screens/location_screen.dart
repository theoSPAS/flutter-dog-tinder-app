import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_event.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../blocs/onboarding/onboarding_bloc.dart';
import '../../../blocs/onboarding/onboarding_state.dart';
import '../../../helpers/sizes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_header.dart';

class LocationScreen extends StatelessWidget {
  final TabController tabController;

  const LocationScreen({Key? key, required this.tabController})
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
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'Enter your name?'),
                    CustomTextField(
                      hint: 'ENTER YOUR NAME',
                      onChanged: (value) {
                        context.read<OnBoardingBloc>().add(
                            UpdateUser(pet: state.pet.copyWith(name: value)));
                      },
                    ),
                    SizedBox(height: height(context) * 0.002),
                    const CustomTextHeader(text: 'Where Are You?'),
                    CustomTextField(hint: 'ENTER YOUR LOCATION',
                    onChanged: (value){
                      context.read<OnBoardingBloc>()
                          .add(UpdateUser(pet:
                      state.pet.copyWith(
                        location: value
                      )));
                    },),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 6,
                      selectedColor: Theme.of(context).primaryColorDark,
                      unselectedColor: Theme.of(context).backgroundColor,
                    ),
                    SizedBox(height: height(context) * 0.02),
                    CustomButton(tabController: tabController, text: 'DONE'),
                  ],
                ),
              ],
            ));
      }else{
        return const Text('Something went wrong.');
      }
    });
  }
}
