import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/blocs/onboarding/onboarding_bloc.dart';
import 'package:mips_project/blocs/onboarding/onboarding_event.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/helpers/values/colors.dart';
import 'package:mips_project/helpers/values/global_keys.dart';
import 'package:mips_project/models/models.dart';
import '../../../cubits/signup/signup_cubit.dart';

class CustomButton extends StatefulWidget {
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width(context) * 0.01),
        gradient: const LinearGradient(
          colors: [
            kBlueMainColorOne,
            kBlueMainColorOne,
          ],
        ),
      ),
      child: SizedBox(
        width: width(context) * 0.8,
        height: height(context) * 0.05,
        child: ElevatedButton(
          onPressed: () async {
            if (widget.tabController.index == 5) {
              Navigator.pushNamed(context, '/');
            } else {
              widget.tabController.animateTo(widget.tabController.index + 1);
            }

            if (widget.tabController.index == 2) {
              await globalKey.currentContext?.read<SingUpCubit>().signUpWithCredentials();

              Pet pet = Pet(
                  id: globalKey.currentContext?.read<SingUpCubit>().state.pet!.uid,
                  location: '',
                  gender: '',
                  name: '',
                  age: 0,
                  imageUrls: const [],
                  description: '',
                  breed: '');

              globalKey.currentContext?.read<OnBoardingBloc>()
                  .add(StartOnBoarding(pet: pet));
            }

            //context.read<OnBoardingBloc>().add(StartOnBoarding(pet: pet));
          },
          style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            elevation: 0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.lora(
                    color: kColorWhite,
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    fontSize: 15.sp),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
