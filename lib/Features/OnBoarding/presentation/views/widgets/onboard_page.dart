import 'package:flutter/material.dart';
import 'package:untitled/Features/OnBoarding/data/model/onboard_model.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({
    super.key,
    required this.model,
  });

  static String id = 'OnBoardPage';

  final OnBoardModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        bottom: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              child: Image.asset(model.image!),
            ),
          ),
          Text(
            model.title!,
            textAlign: TextAlign.center,
            style: AppStyles.calendarDayNamesStyle.copyWith(
              fontSize: 20,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
