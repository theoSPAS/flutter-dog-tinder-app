import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/cubits/signup/signup_state.dart';
import 'package:mips_project/features/onboarding/widgets/custom_text_field.dart';
import 'package:mips_project/helpers/values/global_keys.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../cubits/signup/signup_cubit.dart';
import '../../../helpers/sizes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_header.dart';

class EmailScreen extends StatefulWidget {
  final TabController tabController;

  const EmailScreen({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingUpCubit, SignUpState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomTextHeader(
                    text: 'What\'s Your Email Address?',
                  ),
                  CustomTextField(
                    hint: 'ENTER YOUR EMAIL',
                    onChanged: (value) {
                      context.read<SingUpCubit>().emailChanged(value);
                    },
                  ),
                  SizedBox(height: height(context) * 0.002),
                  const CustomTextHeader(text: 'What\'s Your Password'),
                  CustomTextField(
                    obscure: true,
                    hint: 'ENTER YOUR PASSWORD',
                    onChanged: (value) {
                      context.read<SingUpCubit>().passwordChanged(value);
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  StepProgressIndicator(
                    totalSteps: 6,
                    currentStep: 1,
                    selectedColor: Theme.of(context).primaryColorDark,
                    unselectedColor: Theme.of(context).backgroundColor,
                  ),
                  SizedBox(height: height(context) * 0.02),
                  CustomButton(
                    tabController: widget.tabController,
                    text: 'NEXT STEP',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
