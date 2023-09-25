import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/presentation/views/widgets/major_component.dart';
import 'package:untitled/core/utils/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.majorList});
 final List<MajorModel> majorList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16 * SizeConfig.verticalBlock),
      itemCount: majorList.length,
      itemBuilder:(context, index) => MajorComponent(majorModel: majorList[index],),
    );
  }
}
