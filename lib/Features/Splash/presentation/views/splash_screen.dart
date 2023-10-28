// ignore_for_file: body_might_complete_normally_nullable, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/core/utils/size_config.dart';
import '../../../home/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      var storage = const FlutterSecureStorage();
      String? token = await storage.read(key: "token");
      final per = await SharedPreferences.getInstance();

      bool? b = per.getBool("firstTime");
      if (b == null) {
        Navigator.of(context).pushReplacementNamed(FirstOnBoardingScreen.id);
        await per.setBool("firstTime", true);
      } else {
        if (token == null) {
          Navigator.of(context).pushReplacementNamed(LoginScreen.id);
        } else {
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          height: 150 * SizeConfig.verticalBlock,
          width: 150 * SizeConfig.horizontalBlock,
        ),
      ),
    );
  }
}
