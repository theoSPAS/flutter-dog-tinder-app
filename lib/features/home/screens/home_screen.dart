import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/auth/auth_state.dart';
import 'package:mips_project/blocs/swipe/swipe_bloc.dart';
import 'package:mips_project/blocs/swipe/swipe_event.dart';
import 'package:mips_project/blocs/swipe/swipe_state.dart';
import 'package:mips_project/features/card/screens/pet_card.dart';
import 'package:mips_project/features/details/screens/pet_details.dart';
import 'package:mips_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:mips_project/helpers/sizes.dart';
import '../../../widgets/custom_app_bar.dart';
import '../widgets/choice_button.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/';

  const HomeScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) {
        print(BlocProvider.of<AuthBloc>(context).state.status);
        return BlocProvider.of<AuthBloc>(context).state.status ==
                AuthStatus.unauthenticated
            ? const OnBoardingScreen()
            : const HomeScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height(context) * 0.07),
          child: const CustomAppBar(
            titleText: 'Tindog',
          ),
        ),
        body: BlocBuilder<SwipeBloc, SwipeState>(
          builder: (context, state) {
            if (state is SwipeLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is SwipeLoaded) {
              var petCount = state.pets.length;
              return Column(
                children: [
                  InkWell(
                    onDoubleTap: () {
                      Navigator.pushNamed(context, PetDetailsScreen.routeName,
                          arguments: state.pets[0]);
                    },
                    child: Draggable(
                      child: PetCard(pet: state.pets[0]),
                      feedback: PetCard(pet: state.pets[0]),
                      childWhenDragging:
                        (petCount > 1) ? PetCard(pet: state.pets[1])
                      : Container(),
                      onDragEnd: (drag) {
                        if (drag.velocity.pixelsPerSecond.dx < 0) {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeLeft(pet: state.pets[0]));
                        } else {
                          context
                              .read<SwipeBloc>()
                              .add(SwipeRight(pet: state.pets[0]));
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: width(context) * 0.02,
                        horizontal: width(context) * 0.2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeLeft(pet: state.pets[0]));
                          },
                          child: ChoiceButton(
                            width: width(context) * 0.1,
                            height: height(context) * 0.05,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                            iconData: Icons.clear_rounded,
                            hasGradient: false,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context
                                .read<SwipeBloc>()
                                .add(SwipeRight(pet: state.pets[0]));
                          },
                          child: ChoiceButton(
                              width: width(context) * 0.2,
                              height: height(context) * 0.07,
                              hasGradient: true,
                              size: 30,
                              color: Theme.of(context).primaryColor,
                              iconData: Icons.favorite),
                        ),
                        ChoiceButton(
                            width: width(context) * 0.1,
                            height: height(context) * 0.05,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                            iconData: Icons.watch_later,
                            hasGradient: false),
                      ],
                    ),
                  ),
                ],
              );
            }
            if (state is SwipeError) {
              return Center(
                  child: Text(
                'There aren\'t any more pets to see.',
                style: GoogleFonts.lora(
                  textStyle: Theme.of(context).textTheme.bodyLarge,
                  fontSize: 18.sp
                ),
              ));
            } else {
              return const Text('Something went wrong!');
            }
          },
        ),
      ),
    );
  }
}
