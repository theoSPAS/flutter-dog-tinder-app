import 'package:flutter/material.dart';
import 'package:mips_project/features/profile/screens/profile_screen.dart';
import 'package:mips_project/features/splash/splash_screen.dart';
import 'package:mips_project/models/models.dart';
import '../features/chat/screens/chat_screen.dart';
import '../features/details/screens/pet_details.dart';
import '../features/home/screens/home_screen.dart';
import '../features/login/screens/login_screen.dart';
import '../features/matches/screens/matches_screen.dart';
import '../features/onboarding/screens/onboarding_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case PetDetailsScreen.routeName:
        return PetDetailsScreen.route(pet: settings.arguments as Pet);
      case OnBoardingScreen.routeName:
        return OnBoardingScreen.route();
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case ChatScreen.routeName:
        return ChatScreen.route(petMatch: settings.arguments as PetMatch);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}