import 'package:flutter/material.dart';
import '../../../helpers/sizes.dart';

class PetMultipleImages extends StatelessWidget {
  final String imageUrl;
  final double imageHeight;
  final double imageWidth;

  const PetMultipleImages({Key? key, required this.imageUrl,required this.imageHeight,required this.imageWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height(context) * 0.01, right: height(context) * 0.01),
      height: imageHeight, //60,
      width: imageWidth,//70,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(width(context) * 0.01),
      ),
    );
  }
}
