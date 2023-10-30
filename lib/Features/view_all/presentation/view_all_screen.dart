import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key, required this.doctors});
  static const String id = "ViewAllScreen";
  final List<Doctors> doctors;

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: AppColors.color0xFFF3FAF9,
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'VCare',
            style: AppStyles.color0xFFF3FAF9FontSize20FontWeightW500,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              top: 16 * SizeConfig.verticalBlock,
              right: 20 * SizeConfig.horizontalBlock,
              left: 20 * SizeConfig.horizontalBlock),
          child: GridView.builder(
              itemCount: widget.doctors.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150 * SizeConfig.horizontalBlock,
                  mainAxisSpacing: 10 * SizeConfig.horizontalBlock,
                  crossAxisSpacing: 10 * SizeConfig.verticalBlock,
                  mainAxisExtent: 260 * SizeConfig.verticalBlock),
              itemBuilder: (_, index) {
                return DoctorComponent(doctorModel: widget.doctors[index]);
              }),
        ));
  }
}
