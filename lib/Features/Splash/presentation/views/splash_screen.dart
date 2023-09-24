// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

import '../../../home/presentation/views/home_screen.dart';

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
    Future.delayed(const Duration(seconds: 2),()async{
      var storage =const FlutterSecureStorage();
      String? token=await storage.read(key: "token");
      final per = await SharedPreferences.getInstance();

      bool? b=per.getBool("firstTime");
      if(b==null){
        Navigator.of(context).pushReplacementNamed(FirstOnBoardingScreen.id);
        await per.setBool("firstTime", true);
      }else{
        if(token==null){
          Navigator.of(context).pushReplacementNamed(LoginScreen.id);
        }else{
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
        }
      }

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
