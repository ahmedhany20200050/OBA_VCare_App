import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/utils/size_config.dart';

class MajorComponent extends StatelessWidget {
  final MajorModel majorModel;
  const MajorComponent({super.key, required this.majorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8 * SizeConfig.verticalBlock,
          left: 20 * SizeConfig.horizontalBlock),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(majorModel.name!),
          SizedBox(
            height: 5 * SizeConfig.verticalBlock,
          ),
          SizedBox(
            height: 210 * SizeConfig.verticalBlock,
            child: ListView.builder(
              itemCount: majorModel.doctors!.length,
              itemBuilder: (context, index) => Container(
                  margin:
                      EdgeInsets.only(right: 8 * SizeConfig.horizontalBlock),
                  child:  DoctorComponent(doctorModel: majorModel.doctors![index],),),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
