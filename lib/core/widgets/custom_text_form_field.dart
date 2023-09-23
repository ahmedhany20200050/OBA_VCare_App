import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_styles.dart';
import '../utils/size_config.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      this.suffixIcon,
      this.readOnly = false,
      this.obscureText = false, this.maxLines=1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.horizontalBlock,
          vertical: 4 * SizeConfig.verticalBlock),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: SizeConfig.horizontalBlock,
              color: AppColors.color0xFF091E4A),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: TextFormField(
        obscureText: obscureText,
        maxLines: maxLines,
        readOnly: readOnly,
        onTapOutside: (_) => FocusScope.of(context).unfocus(),
        controller: controller,
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            suffixIcon: suffixIcon,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: AppStyles
                .color0xFF091E4AFontSize16FontWeightW400Height11AfterTheDecimalPartLetterSpacing44AfterTheDecimalPart),
      ),
    );
  }
}
