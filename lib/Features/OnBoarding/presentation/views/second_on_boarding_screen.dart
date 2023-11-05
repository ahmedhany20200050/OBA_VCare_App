// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class SecondOnBoardingScreen extends StatelessWidget {
  static const id = 'SecondOnBoardingScreen';

  const SecondOnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(LoginScreen.id);
        },
        child: Ink(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            height: 50,
            width: 50,
            child: const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset("assets/images/secondOnBoardingScreen.jpg")),
            Text(
              "The Best Doctors",
              style: AppStyles.homeTitleStyle
                  .copyWith(fontSize: 32 * SizeConfig.textRatio),
            ),
          ],
        ),
      ),
    );
  }
}
