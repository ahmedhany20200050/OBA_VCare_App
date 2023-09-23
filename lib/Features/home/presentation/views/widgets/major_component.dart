import 'package:flutter/material.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/utils/size_config.dart';

class MajorComponent extends StatelessWidget {
  final String majorTitle;
  const MajorComponent({super.key, required this.majorTitle});

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
          Text(majorTitle),
          SizedBox(
            height: 5 * SizeConfig.verticalBlock,
          ),
          SizedBox(
            height: 210 * SizeConfig.verticalBlock,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                  margin:
                      EdgeInsets.only(right: 8 * SizeConfig.horizontalBlock),
                  child: const DoctorComponent()),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
