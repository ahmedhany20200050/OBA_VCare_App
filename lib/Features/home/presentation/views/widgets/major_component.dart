import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/Features/view_all/presentation/view_all_screen.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/utils/size_config.dart';

class MajorComponent extends StatelessWidget {
  final MajorModel majorModel;
  const MajorComponent({super.key, required this.majorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 8 * SizeConfig.verticalBlock,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(majorModel.name!,
                  style: AppStyles.color0xFF020D18FontSize12FontWeightW700
                      .copyWith(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                  )),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ViewAllScreen.id,
                      arguments: majorModel.doctors);
                },
                icon: SvgPicture.asset(
                  AppAssets.arrowIcon,
                  width: 20 * SizeConfig.horizontalBlock,
                ),
              )
            ],
          ),
          SizedBox(
            height: 260 * SizeConfig.verticalBlock,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: majorModel.doctors!.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(right: 8 * SizeConfig.horizontalBlock),
                child: DoctorComponent(
                  doctorModel: majorModel.doctors![index],
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
          )
        ],
      ),
    );
  }
}
