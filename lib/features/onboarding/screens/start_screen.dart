import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/features/onboarding/widgets/custom_button.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/helpers/values/colors.dart';

class StartScreen extends StatelessWidget {
  final TabController tabController;

  const StartScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width(context) * 0.2),
              child: Column(
                children: [
                  SizedBox(
                      height: width(context) * 0.5,
                      width: width(context) * 0.6,
                      child: Image.asset(
                        'assets/images/dogs_start_screen.png',
                      )),
                  SizedBox(
                    height: height(context) * 0.01,
                  ),
                  Text(
                    'Welcome to Tindog',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lora(
                      color: kBlueMainColorOne,
                      textStyle: Theme.of(context).textTheme.headlineLarge,
                      fontSize: 35.sp
                    ),
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Text(
                    'Tindog is an online dating and geosocial networking application. In Tindog, users "swipe right" to like or "swipe left" to dislike other users\' (pets) profiles, which include their photo, a short bio, and a list of their information.',
                    style: GoogleFonts.lora(
                        textStyle: Theme.of(context).textTheme.headlineSmall,
                        fontSize: 13.sp
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                ],
              ),
            ),
            CustomButton(tabController: tabController, text: 'START')
          ],
        ));
  }
}
