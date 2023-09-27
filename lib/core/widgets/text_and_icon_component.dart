import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/utils/size_config.dart';

class TextAndIconComponent extends StatelessWidget {
  final Color? iconColor;
  final bool mustBeMaxSize;
  final String text;
  final TextStyle textStyle;
  final String? iconAsset;
  const TextAndIconComponent(
      {super.key,
      this.iconColor,
      required this.text,
      this.iconAsset,
      required this.textStyle, this.mustBeMaxSize = true,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: mustBeMaxSize?MainAxisSize.max:MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (iconAsset != null) ...[
          SvgPicture.asset(
            iconAsset!,
            color: iconColor,
            width: 24 * SizeConfig.horizontalBlock,
            height: 24 * SizeConfig.verticalBlock,
          )
        ],
        Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ],
    );
  }
}
