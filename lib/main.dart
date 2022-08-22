import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mips_project/blocs/auth/auth_bloc.dart';
import 'package:mips_project/blocs/profile/profile_bloc.dart';
import 'package:mips_project/blocs/profile/profile_event.dart';
import 'package:mips_project/blocs/swipe/swipe_bloc.dart';
import 'package:mips_project/blocs/swipe/swipe_event.dart';
import 'package:mips_project/cubits/login/login_cubit.dart';
import 'package:mips_project/features/login/screens/login_screen.dart';
import 'package:mips_project/features/splash/splash_screen.dart';
import 'package:mips_project/models/models.dart';
import 'package:mips_project/repositories/auth/auth_repository.dart';
import 'package:mips_project/repositories/database/database_repository.dart';
import 'package:mips_project/repositories/storage/storage_repository.dart';
import 'blocs/onboarding/onboarding_bloc.dart';
import 'cubits/signup/signup_cubit.dart';
import 'helpers/app_routes.dart';
import 'helpers/values/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(
          create: (context) => DatabaseRepository(),
        ),
        RepositoryProvider(
          create: (context) => StorageRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  AuthBloc(authRepository: context.read<AuthRepository>())),
          BlocProvider<SingUpCubit>(
            create: (context) =>
                SingUpCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<LoginCubit>(
            create: (context) =>
                LoginCubit(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<OnBoardingBloc>(
            create: (context) => OnBoardingBloc(
              databaseRepository: context.read<DatabaseRepository>(),
              storageRepository: context.read<StorageRepository>(),
            ),
          ),
          BlocProvider(
            create: (context) => SwipeBloc(
              databaseRepository: context.read<DatabaseRepository>(),
              authBloc: context.read<AuthBloc>(),
            ),
          ),
          BlocProvider(
              create: (context) => ProfileBloc(
                    authBloc: context.read<AuthBloc>(),
                    databaseRepository: context.read<DatabaseRepository>(),
                  )..add(LoadProfile(
                      userId: context.read<AuthBloc>().state.user!.uid))),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tindog',
          theme: ThemeData(
            textTheme: GoogleFonts.latoTextTheme(
              Theme.of(context).textTheme,
            ),
            primaryColor: kColorRed,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            brightness: Brightness.light,
            cupertinoOverrideTheme:
                const CupertinoThemeData(brightness: Brightness.light),
            buttonTheme: const ButtonThemeData(disabledColor: kCanvasMainColor),
          ),
          builder: (context, widget) {
            ScreenUtil.init(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
