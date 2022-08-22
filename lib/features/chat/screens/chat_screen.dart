import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/features/chat/widgets/messages.dart';
import 'package:mips_project/features/chat/widgets/new_message.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/models/models.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../helpers/values/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ChatScreen extends StatelessWidget {
  static const String routeName = '/chat';

  static Route route({required PetMatch petMatch}) {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => ChatScreen(petMatch: petMatch),
    );
  }

  final PetMatch petMatch;

  const ChatScreen({Key? key, required this.petMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: kGrayAppBarColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: kColorBlack,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          //automaticallyImplyLeading: false,
          centerTitle: true,
          title: Column(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(petMatch.matchedPet.imageUrls[0]),
              ),
              Text(
                petMatch.matchedPet.name,
                style: GoogleFonts.lora(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: const [
              Expanded(child: Messages()),
              NewMessage()
            ],
          ),
        ),);
  }
}
