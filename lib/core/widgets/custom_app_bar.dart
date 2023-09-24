import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.color0xFFF3FAF9,
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'VCare',
        style: AppStyles.color0xFFF3FAF9FontSize20FontWeightW500,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56 * SizeConfig.verticalBlock);
}
