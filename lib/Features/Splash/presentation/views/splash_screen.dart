// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

   SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.of(context).pushNamed(FirstOnBoardingScreen.id);
    } );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding:const EdgeInsets.all(20),child: Image.asset("assets/images/medical-app.png")),
            Text("VCare App",style: AppStyles.homeTitleStyle.copyWith(fontSize: 32*SizeConfig.textRatio),),
          ],
        ),
      ),
    );
  }
}
