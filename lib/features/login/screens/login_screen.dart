import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/auth/auth_state.dart';
import 'package:mips_project/cubits/login/login_cubit.dart';
import 'package:mips_project/features/home/screens/home_screen.dart';
import 'package:mips_project/features/login/widgets/custom_elevated_button.dart';
import 'package:mips_project/features/onboarding/screens/onboarding_screen.dart';
import 'package:mips_project/helpers/values/colors.dart';

import '../../../cubits/login/login_state.dart';
import '../../../helpers/sizes.dart';
import '../../../widgets/custom_app_bar.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  static Route route(){
    return MaterialPageRoute(
         settings: const RouteSettings(name: routeName),
        builder: (context){
           return BlocProvider.of<AuthBloc>(context)
             .state.status == AuthStatus.authenticated ?
           const HomeScreen() :const LoginScreen();
        },
    );
  }
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height(context) * 0.1),
        child: const CustomAppBar(
          titleText: 'Start',
          hasActions: false,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EmailInput(),
            const SizedBox(height: 10,),
            PasswordInput(),
            const SizedBox(height: 20,),
           Container(
             width: 300,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 CustomElevatedButton(
                     text: 'LOGIN',
                     beginColor: kBlueMainColorOne,
                     endColor: kBlueMainColorOne.withAlpha(1000),
                     textColor: kColorWhite,
                     onPressed: (){
                      context.read<LoginCubit>().logInWithCredentials();
                     },),
                 const SizedBox(height: 10,),
                 CustomElevatedButton(
                     text: 'SIGNUP',
                     beginColor: kBlueMainColorOne.withAlpha(1000),
                     endColor: kBlueMainColorOne,
                     textColor: kColorWhite,
                     onPressed: () => Navigator.of(context)
                   .pushNamedAndRemoveUntil(
                     OnBoardingScreen.routeName,
                            ModalRoute.withName('/onboarding'),),),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget{
  const EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocBuilder<LoginCubit,LoginState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        );
      }
    );
  }
}

class PasswordInput extends StatelessWidget{
  const PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return BlocBuilder<LoginCubit,LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          obscureText: true,
        );
      }
    );
  }
}
