import 'package:flutter/material.dart';
import 'package:untitled/Features/home/presentation/views/widgets/major_component.dart';
import 'package:untitled/core/utils/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 16 * SizeConfig.verticalBlock),
      children: const [
        MajorComponent(majorTitle: "Basel"),
        MajorComponent(majorTitle: "Basel"),
        MajorComponent(majorTitle: "Basel"),
      ],
    );
  }
}
