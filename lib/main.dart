import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:untitled/Features/Splash/presentation/views/splash_screen.dart';
import 'package:untitled/Features/login/presentation/manger/cubit/login_cubit.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/Features/register/presentation/manger/cubit/register_cubit.dart';
import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: SplashScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          SplashScreen.id: (context) =>  SplashScreen(),
          FirstOnBoardingScreen.id:(context) => const FirstOnBoardingScreen(),
          SecondOnBoardingScreen.id:(context) => const SecondOnBoardingScreen(),
        },
      ),
    );
  }
}


