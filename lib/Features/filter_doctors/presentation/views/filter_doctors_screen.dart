import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_states.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

class FilterDoctorsScreen extends StatelessWidget {
  const FilterDoctorsScreen({super.key});
  static const String id = "FilterDoctorsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: BlocBuilder<FilterDoctorCubit, FilterDoctorStates>(
          builder: (context, state) {
            if (state is FilterDoctorSuccessState) {
              return Padding(
                  padding: EdgeInsets.only(
                      top: 16 * SizeConfig.verticalBlock,
                      left: 20 * SizeConfig.horizontalBlock,
                      right: 20 * SizeConfig.horizontalBlock),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150 * SizeConfig.horizontalBlock,
                        mainAxisExtent: 210 * SizeConfig.verticalBlock,
                        mainAxisSpacing: 10 * SizeConfig.verticalBlock,
                        crossAxisSpacing: 10 * SizeConfig.horizontalBlock),
                    itemBuilder: (_, index) => DoctorComponent(
                      doctorModel: state.doctors[index],
                    ),
                    itemCount: state.doctors.length,
                  ));
            } else if (state is FilterDoctorErrorState) {
              return Center(
                child: Text(state.errorMessage),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ));
  }
}
