import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/text_and_icon_component.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool mustBeMaxSize;
  final void Function() onTap;
  final double verticalPadding;
  final String? iconAsset;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onTap,
      this.iconAsset,
      required this.verticalPadding, this.mustBeMaxSize = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding,
              horizontal: 16 * SizeConfig.horizontalBlock),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: AppColors.color0xFF173F68,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            shadows: const [
              BoxShadow(
                color: AppColors.color0x3D000000,
                blurRadius: 2,
                offset: Offset(0, 2),
                spreadRadius: 0,
              )
            ],
          ),
          child: TextAndIconComponent(
            mustBeMaxSize: mustBeMaxSize,
            text: buttonText,
            iconAsset: iconAsset,
            textStyle: AppStyles.buttonTextStyle,
          ),
        ));
  }
}
