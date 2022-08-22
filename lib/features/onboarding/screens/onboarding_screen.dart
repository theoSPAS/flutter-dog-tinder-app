import 'package:flutter/material.dart';
import 'package:mips_project/features/onboarding/screens/description_screen.dart';
import 'package:mips_project/features/onboarding/screens/demographics_screen.dart';
import 'package:mips_project/features/onboarding/screens/pictures_screen.dart';
import 'package:mips_project/features/onboarding/screens/start_screen.dart';
import 'package:mips_project/helpers/sizes.dart';
import 'package:mips_project/helpers/values/global_keys.dart';
import 'package:mips_project/widgets/custom_app_bar.dart';
import 'email_screen.dart';
import 'location_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const OnBoardingScreen(),
    );
  }

  const OnBoardingScreen({Key? key}) : super(key: key);

  static const List<Tab> tabs = [
    Tab(
      text: 'Start',
    ),
    Tab(
      text: 'Email',
    ),
    Tab(
      text: 'Demographics',
    ),
    Tab(
      text: 'Pictures',
    ),
    Tab(
      text: 'Description',
    ),
    Tab(text: 'Location',)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        return SafeArea(
            child: Scaffold(
              key: globalKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height(context) * 0.1),
            child: const CustomAppBar(
              titleText: 'Start',
              hasActions: false,
            ),
          ),
          body: TabBarView(
            children: [
              StartScreen(tabController: tabController),
              EmailScreen(tabController: tabController),
              DemographicsScreen(tabController: tabController,),
              PicturesScreen(tabController: tabController),
              DescriptionScreen(tabController: tabController),
              LocationScreen(tabController: tabController),
            ],
          ),
        ));
      }),
    );
  }
}
