import 'package:flutter/material.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/views/doctor_details.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class DoctorComponent extends StatelessWidget {
  const DoctorComponent({super.key, required this.doctorModel});
  final Doctors doctorModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        decoration: ShapeDecoration(
          color: AppColors.color0xFFF3FAF9,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        width: 160 * SizeConfig.horizontalBlock,
        child: Column(
          children: [
            Container(
              height: 100 * SizeConfig.verticalBlock,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    doctorModel.gender!.contains('fe') ||
                            doctorModel.name!.startsWith('Ms.') ||
                            doctorModel.name!.startsWith('Miss')
                        ? 'assets/images/doctor-woman.jpg'
                        : 'assets/images/doctor-man.jpg',
                  ),
                  fit: BoxFit.fill,
                ),
                color: AppColors.color0xFF173F68,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 5 * SizeConfig.verticalBlock,
            ),
            Container(
              padding: EdgeInsets.only(
                  left: 8 * SizeConfig.horizontalBlock,
                  right: 16 * SizeConfig.horizontalBlock),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorModel.name!,
                    style: AppStyles.color0xFF020D18FontSize16FontWeightW400
                        .copyWith(
                      color: AppColors.primaryColor,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5 * SizeConfig.verticalBlock),
                  Text('Specialization : ',
                      style: AppStyles.color0xB2030E19FontSize12FontWeightW400
                          .copyWith(
                        color: AppColors.primaryColor,
                      )),
                  Row(
                    children: [
                      SizedBox(width: 30 * SizeConfig.horizontalBlock),
                      Text(doctorModel.specialization!.name!,
                          style: AppStyles
                              .color0xB2030E19FontSize12FontWeightW400
                              .copyWith(
                            color: AppColors.colorBlack,
                          )),
                    ],
                  ),
                  Text('Degree : ',
                      style: AppStyles.color0xB2030E19FontSize12FontWeightW400
                          .copyWith(
                        color: AppColors.primaryColor,
                      )),
                  Row(
                    children: [
                      SizedBox(width: 30 * SizeConfig.horizontalBlock),
                      Text(
                        doctorModel.degree!,
                        style: AppStyles.color0xB2030E19FontSize12FontWeightW400
                            .copyWith(
                          color: AppColors.colorBlack,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5 * SizeConfig.verticalBlock),
                  Align(
                    alignment: Alignment.center,
                    child: Card(
                      color: AppColors.primaryColor,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            DoctorDetails.id,
                            arguments: doctorModel.id.toString(),
                          );
                        },
                        child: Text(
                          "Book",
                          style: AppStyles
                              .color0xFF020D18FontSize12FontWeightW400
                              .copyWith(
                            color: AppColors.colorWhite,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
