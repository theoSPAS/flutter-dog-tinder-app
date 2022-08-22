import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/models/models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mips_project/widgets/pet_image.dart';
import '../../../helpers/values/colors.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  const PetCard({Key? key, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'pet_image',
      child: Padding(
        padding: EdgeInsets.only(
          top: height(context) * 0.02,
          bottom: height(context) * 0.02,
          left: height(context) * 0.02,
          right: height(context) * 0.02,
        ),
        child: SizedBox(
          height: height(context) / 1.4,
          width: width(context),
          child: Stack(
            children: [
              PetImage.large(
                url: pet.imageUrls[0],
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width(context) * 0.01),
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter)),
              ),
              Positioned(
                bottom: width(context) * 0.02,
                left: width(context) * 0.04,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${pet.name}, ${pet.age}',
                        style: GoogleFonts.lora(
                          fontSize: 17.sp,
                          color: kColorWhite,
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        )
                    ),
                    Text(
                      '${pet.breed}, ${pet.gender}',
                    style: GoogleFonts.lora(
                      fontSize: 13.sp,
                      color: kColorWhite,
                      textStyle: Theme.of(context).textTheme.titleMedium,
                    ),
                    ),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                           shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: pet.imageUrls.length + 1,
                          itemBuilder: (builder, index){
                             return (index < pet.imageUrls.length) ?
                             PetImage.small(
                               url: pet.imageUrls[index],
                               margin: const EdgeInsets.only(
                                 top: 8,
                                 right: 8
                               ),
                             ) :SizedBox(
                                  width: width(context) * 0.1,
                                  child: Container(
                                    width: width(context) * 0.2,
                                    height: height(context) * 0.04,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: kColorWhiteGrayish,
                                    ),
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 25,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
