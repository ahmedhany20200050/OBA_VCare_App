import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

class ProfileChangePassword extends StatelessWidget {
  const ProfileChangePassword({super.key});
  static String id = "ProfileChangePassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.horizontalBlock,
          vertical: 20 * SizeConfig.verticalBlock,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25 * SizeConfig.horizontalBlock,
              ),
              child: Column(
                children: [
                  Text(
                    'Request sent!',
                    style: AppStyles.textStyle34w400roboto,
                  ),
                  SizedBox(
                    height: 15 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    'A request to reset your password has been issued, we\'ll reply to you soon!',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle34w400roboto.copyWith(
                      fontSize: 14 * SizeConfig.textRatio,
                      color: AppColors.colorBlack.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  SizedBox(
                    height: 48 * SizeConfig.verticalBlock,
                    width: 312 * SizeConfig.horizontalBlock,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                      onPressed: () {},
                      child: Text(
                        "HOME",
                        textAlign: TextAlign.center,
                        style: AppStyles.buttonTextStyle,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
