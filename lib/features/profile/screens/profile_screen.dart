import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/auth/auth_state.dart';
import 'package:mips_project/blocs/profile/profile_bloc.dart';
import 'package:mips_project/blocs/profile/profile_state.dart';
import 'package:mips_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:mips_project/features/profile/widgets/title_with_icon.dart';
import 'package:mips_project/helpers/values/colors.dart';
import 'package:mips_project/models/models.dart';
import 'package:mips_project/repositories/auth/auth_repository.dart';
import 'package:mips_project/widgets/custom_app_bar.dart';
import 'package:mips_project/widgets/pet_image.dart';

import '../../../helpers/sizes.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) {
          print(BlocProvider.of<AuthBloc>(context).state.status);
          return (BlocProvider.of<AuthBloc>(context).state.status ==
                  AuthStatus.unauthenticated)
              ? const OnBoardingScreen()
              : const ProfileScreen();
        });
  }

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.05),
        child: const CustomAppBar(
          titleText: 'Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              return Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  PetImage.medium(
                    url: state.pet.imageUrls[0],
                    child: Container(
                      height: height(context) / 4,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Text(
                            state.pet.name,
                            style: GoogleFonts.lora(
                              fontSize: 17.sp,
                              color: kColorWhite,
                              textStyle: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleWithIcon(
                            title: 'Biography', iconData: Icons.edit),
                        Text(
                          state.pet.description,
                          style: GoogleFonts.lora(
                            fontSize: 10.sp,
                            color: kColorBlack,
                            textStyle: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                        const TitleWithIcon(
                            title: 'Pictures', iconData: Icons.edit),
                        SizedBox(
                          height: 110,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.pet.imageUrls.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: PetImage.small(
                                    width: 100,
                                    url: state.pet.imageUrls[index],
                                  ),
                                );
                              }),
                        ),
                        const TitleWithIcon(
                            title: 'Location', iconData: Icons.edit),
                        Text(state.pet.location,
                            style: GoogleFonts.lora(
                              fontSize: 10.sp,
                              color: kColorBlack,
                              textStyle: Theme.of(context).textTheme.subtitle2,
                            )),
                        const TitleWithIcon(
                            title: 'Breed', iconData: Icons.edit),
                        Text(state.pet.breed,
                            style: GoogleFonts.lora(
                              fontSize: 10.sp,
                              color: kColorBlack,
                              textStyle: Theme.of(context).textTheme.subtitle2,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: SizedBox(
                              width: width(context) * 0.8,
                              height: height(context) * 0.05,
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        kBlueMainColorOne),
                                  ),
                                  onPressed: () {
                                    RepositoryProvider.of<AuthRepository>(
                                            context)
                                        .signOut();
                                  },
                                  child: Text(
                                    'Sign Out',
                                    style: GoogleFonts.lora(
                                      color: kColorWhite,
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const Text('Something went wrong.');
            }
          },
        ),
      ),
    );
  }
}
