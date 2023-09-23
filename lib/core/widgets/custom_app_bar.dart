import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('VCare'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56*SizeConfig.verticalBlock);
}
