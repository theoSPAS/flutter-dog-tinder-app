import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_state.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../helpers/sizes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_container.dart';
import '../widgets/custom_text_header.dart';

class PicturesScreen extends StatelessWidget {
  final TabController tabController;

  const PicturesScreen({Key? key, required this.tabController})
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
        var images = state.pet.imageUrls;
        var imageCount = images.length;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0,
              vertical: 50,),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(text: 'Add 2 or More Pictures'),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 400,
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, childAspectRatio: 0.65,
                            mainAxisSpacing: 5),
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return (imageCount > index)
                              ? Container(
                            padding: const EdgeInsets.only(top: 10),
                                child: CustomImageContainer(
                                    imageUrl: images[index],
                                  ),
                              )
                              : const CustomImageContainer();
                        }),
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 4,
                    selectedColor: Theme.of(context).primaryColorDark,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: height(context) * 0.02),
                  CustomButton(tabController: tabController, text: 'NEXT STEP'),
                ],
              )
            ],
          ),
        );
      } else {
        return const Text('Something went wrong.');
      }
    });
  }
}
