import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/utils/size_config.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  const CustomExpansionTile({super.key, required this.title, required this.children});

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      maintainState: true,
      tilePadding: EdgeInsets.zero,
      title: Text(
        widget.title,
        style: AppStyles.color0xFF020D18FontSize12FontWeightW700,
      ),
      expandedAlignment: Alignment.topLeft,
      trailing: SvgPicture.asset(
        !isExpanded ? AppAssets.plusIcon : AppAssets.minusIcon,
        width: 20 * SizeConfig.horizontalBlock,
        height: !isExpanded
            ? 20 * SizeConfig.verticalBlock
            : 15 * SizeConfig.verticalBlock,
      ),
      onExpansionChanged: (isExpanded) {
        setState(() {
          this.isExpanded = isExpanded;
        });
      },
      children: widget.children,
    );
  }
}
