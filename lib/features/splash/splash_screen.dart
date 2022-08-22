import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/auth/auth_state.dart';
import 'package:mips_project/features/home/screens/home_screen.dart';
import 'package:mips_project/features/login/screens/login_screen.dart';
import 'package:mips_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:mips_project/helpers/sizes.dart';

import '../../widgets/custom_app_bar.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const SplashScreen(),
        settings: const RouteSettings(name: routeName));
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('Listener');
          if (state.status == AuthStatus.unauthenticated) {
            Timer(
                const Duration(seconds: 1),
                () => Navigator.pushNamed(
                    context,
                    LoginScreen.routeName,));
          } else if (state.status == AuthStatus.authenticated) {
            Timer(const Duration(seconds: 1),
                () => Navigator.of(context).pushNamed(HomeScreen.routeName));
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(height(context) * 0.0005),
            child: const CustomAppBar(
              titleText: '',
              hasActions: false,
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/svgs/logo.png',
                  height: height(context) * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
