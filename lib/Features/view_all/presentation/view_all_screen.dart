import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

class ViewAllScreen extends StatefulWidget {
  const ViewAllScreen({super.key});
  static const String id = "ViewAllScreen";

  @override
  State<ViewAllScreen> createState() => _ViewAllScreenState();
}

class _ViewAllScreenState extends State<ViewAllScreen> {
  List<Doctors> doctors = [];
  @override
  void didChangeDependencies() {
    doctors = ModalRoute.of(context)!.settings.arguments as List<Doctors>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.only(
              top: 16 * SizeConfig.verticalBlock,
              right: 20 * SizeConfig.horizontalBlock,
              left: 20 * SizeConfig.horizontalBlock),
          child: GridView.builder(
              itemCount: doctors.length,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150 * SizeConfig.horizontalBlock,
                  mainAxisSpacing: 10 * SizeConfig.horizontalBlock,
                  crossAxisSpacing: 10 * SizeConfig.verticalBlock,
                  mainAxisExtent: 210 * SizeConfig.verticalBlock),
              itemBuilder: (_, index) {
                return DoctorComponent(doctorModel: doctors[index]);
              }),
        ));
  }
}
