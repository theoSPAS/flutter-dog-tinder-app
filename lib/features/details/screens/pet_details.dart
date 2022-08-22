import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/features/home/widgets/choice_button.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/helpers/values/colors.dart';
import 'package:mips_project/models/models.dart';

class PetDetailsScreen extends StatelessWidget {
  static const String routeName = '/pet-details';

  static Route route({required Pet pet}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => PetDetailsScreen(pet: pet),
    );
  }

  final Pet pet;
  const PetDetailsScreen({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height(context) / 2,
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: width(context) * 0.1),
                    child: Hero(
                      tag: 'pet_image',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.only(bottomLeft: Radius.circular(width(context) * 0.02),
                                    bottomRight: Radius.circular(width(context) * 0.03)),
                            image: DecorationImage(
                                image: NetworkImage(
                                  pet.imageUrls[0],
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  Align(alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: kColorWhite,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width(context) * 0.2,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ChoiceButton(
                              width: width(context) * 0.1,
                              height: height(context) * 0.1,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                              iconData: Icons.clear_rounded,
                              hasGradient: false),
                          ChoiceButton(
                              width: width(context) * 0.13,
                              height: height(context) * 0.1,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                              iconData: Icons.favorite,
                              hasGradient: false),
                          ChoiceButton(
                              width: width(context) * 0.1,
                              height: height(context) * 0.1,
                              size: 20,
                              color: Theme.of(context).primaryColor,
                              iconData: Icons.watch_later,
                              hasGradient: false)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width(context) * 0.04,
                  vertical: width(context) * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pet.name}, ${pet.age}',
                      style: GoogleFonts.lora(
                        fontSize: 18.sp,
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      )
                  ),
                  Row(
                    children: [
                      Text(
                        '${pet.breed}, ${pet.gender}',
                          style: GoogleFonts.lora(
                            fontSize: 15.sp,
                            textStyle: Theme.of(context).textTheme.titleMedium,
                          )
                      ),
                      pet.gender == 'Female' ? const Icon(Icons.female, color: kColorRed,) : const Icon(Icons.male, color: kColorBlue)
                    ],
                  ),
                  SizedBox(
                    height: height(context) * 0.02,
                  ),
                  Text(
                    'About',
                      style: GoogleFonts.lora(
                        fontSize:20.sp,
                        textStyle: Theme.of(context).textTheme.titleMedium,
                      )
                  ),
                  Text(
                    pet.description,
                      style: GoogleFonts.lora(
                        fontSize: 12.sp,
                        textStyle: Theme.of(context).textTheme.titleSmall,
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
