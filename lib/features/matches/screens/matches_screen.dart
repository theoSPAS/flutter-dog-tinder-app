import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/features/card/widgets/pet_multiple_images.dart';
import 'package:mips_project/features/chat/screens/chat_screen.dart';
import 'package:mips_project/models/models.dart';
import 'package:mips_project/widgets/custom_app_bar.dart';

import '../../../helpers/sizes.dart';
import '../../../helpers/values/colors.dart';
import '../../../repositories/auth/auth_repository.dart';

class MatchesScreen extends StatelessWidget {
  static const String routeName = '/matches';

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const MatchesScreen());
  }

  const MatchesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inactiveMatches = PetMatch.matches
        .where((pet) => pet.petId == 1 && pet.chat!.isEmpty)
        .toList();
    final activeMatches = PetMatch.matches
        .where((pet) => pet.petId == 1 && pet.chat!.isNotEmpty)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.07),
        child: const CustomAppBar(
          titleText: 'Chats',
        ),
      ),
      body: SafeArea(
        child: Container(
          height: height(context),
          width: width(context),
          margin: EdgeInsets.only(
            left: 0.05 * width(context),
            // right: 0.040 * width(context),
            // top: 0.02 * height(context),
            // bottom: 0.06 * height(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Likes',
                style: GoogleFonts.lora(
                  fontSize: 20.sp,
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              SizedBox(
                height: height(context) * 0.15,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: inactiveMatches.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          PetMultipleImages(
                              imageHeight: height(context) * 0.09,
                              imageWidth: width(context) * 0.16,
                              imageUrl: inactiveMatches[index]
                                  .matchedPet
                                  .imageUrls[0]),
                          Text(
                            inactiveMatches[index].matchedPet.name,
                            style: GoogleFonts.lora(
                              textStyle: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              Text(
                'Your Chats',
                style: GoogleFonts.lora(
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    fontSize: 20.sp),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: activeMatches.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, ChatScreen.routeName,
                          arguments: activeMatches[index]
                        );
                      },
                      child: Row(
                        children: [
                          PetMultipleImages(
                              imageHeight: height(context) * 0.09,
                              imageWidth: width(context) * 0.20,
                              imageUrl:
                                  activeMatches[index].matchedPet.imageUrls[0]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                activeMatches[index].matchedPet.name,
                                style: GoogleFonts.lora(
                                    fontSize: 12.sp,
                                    textStyle:
                                        Theme.of(context).textTheme.titleLarge,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height(context) * 0.006,
                              ),
                              Text(
                                activeMatches[index].chat![0].messages[0].message,
                                style: GoogleFonts.lora(
                                  fontSize: 10.sp,
                                  textStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              SizedBox(
                                height: height(context) * 0.006,
                              ),
                              Text(
                                activeMatches[index]
                                    .chat![0]
                                    .messages[0]
                                    .timeString,
                                style: GoogleFonts.lora(
                                  fontSize: 10.sp,
                                  textStyle:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
              // TextButton(
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all(
              //           kBlueMainColorOne),
              //     ),
              //     onPressed: () {
              //       RepositoryProvider.of<AuthRepository>(
              //           context)
              //           .signOut();
              //     },
              //     child: Text(
              //       'Sign Out',
              //       style: GoogleFonts.lora(
              //         color: kColorWhite,
              //         textStyle: Theme.of(context)
              //             .textTheme
              //             .titleMedium,
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
