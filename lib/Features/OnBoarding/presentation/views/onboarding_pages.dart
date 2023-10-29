// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/Features/OnBoarding/data/model/onboard_model.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/widgets/onboard_page.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/core/app_colors.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});
  static const id = 'OnBoardingPages';

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  bool lastpage = false;
  PageController control = PageController();
  List<OnBoardModel> onboardlist = [
    OnBoardModel(
      image: 'assets/images/Doctors.png',
      title: 'You will find all your prefered doctors here',
    ),
    OnBoardModel(
      image: 'assets/images/medicine.png',
      title: 'Choose from the best',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              final per = await SharedPreferences.getInstance();
              await per.setBool("firstTime", false);
              Navigator.of(context).pushReplacementNamed(LoginScreen.id);
            },
            child: const Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == (onboardlist.length - 1)) {
                    setState(() {
                      lastpage = true;
                    });
                  } else {
                    setState(() {
                      lastpage = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: control,
                itemBuilder: (context, index) => OnBoardPage(
                  model: onboardlist[index],
                ),
                itemCount: onboardlist.length,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: control,
                      count: onboardlist.length,
                      onDotClicked: (index) => control.jumpToPage(index),
                      effect: const ExpandingDotsEffect(
                        expansionFactor: 4,
                        activeDotColor: AppColors.primaryColor,
                        dotWidth: 20,
                        dotHeight: 20,
                        spacing: 10,
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () async {
                    if (lastpage) {
                      final per = await SharedPreferences.getInstance();
                      await per.setBool("firstTime", false);
                      Navigator.of(context)
                          .pushReplacementNamed(LoginScreen.id);
                    } else {
                      control.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward,
                    color: AppColors.colorWhite,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
