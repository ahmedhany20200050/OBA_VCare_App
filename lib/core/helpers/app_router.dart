import 'package:flutter/material.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/views/doctor_details.dart';
import 'package:untitled/Features/home/presentation/views/home_screen.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:untitled/Features/Splash/presentation/views/splash_screen.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import 'package:untitled/Features/success_state/view/success_screen.dart';
import 'package:untitled/Features/user_profile_edit/presentation/views/user_profile_edit.dart';

class AppRouter {
  static Route? generatedRoutes(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case SplashScreen.id:
        return AnimatedTransition(
          page: const SplashScreen(),
        );
      case LoginScreen.id:
        return AnimatedTransition(
          page: const LoginScreen(),
        );
      case RegisterScreen.id:
        return AnimatedTransition(
          page: const RegisterScreen(),
        );
      case HomeScreen.id:
        return AnimatedTransition(
          page: const HomeScreen(),
        );
      case FirstOnBoardingScreen.id:
        return AnimatedTransition(
          page: const FirstOnBoardingScreen(),
        );
      case SecondOnBoardingScreen.id:
        return AnimatedTransition(
          page: const SecondOnBoardingScreen(),
        );
      case DoctorDetails.id:
        return AnimatedTransition(
          page: const DoctorDetails(),
        );
      case SuccessStateScreen.id:
        return AnimatedTransition(
          page: const SuccessStateScreen(),
        );
      case UserProfileEdit.id:
        return AnimatedTransition(
          page: const UserProfileEdit(),
        );
    }
    return null;
  }
}

class AnimatedTransition extends PageRouteBuilder {
  final Widget page;
  AnimatedTransition({required this.page})
      : super(
          pageBuilder: (context, animation, secondAnimation) => page,
          transitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondAnimation, child) {
            const begin = Offset(-1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            final tween = Tween(begin: begin, end: end);
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );
            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          },
        );
}
