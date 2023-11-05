import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_states.dart';
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class FilterDoctorsScreen extends StatelessWidget {
  const FilterDoctorsScreen({super.key});
  static const String id = "FilterDoctorsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: AppColors.colorWhite,
          backgroundColor: AppColors.primaryColor,
        ),
        body: BlocBuilder<FilterDoctorCubit, FilterDoctorStates>(
          builder: (context, state) {
            if (state is FilterDoctorSuccessState) {
              return Padding(
                  padding: EdgeInsets.only(
                      left: 20 * SizeConfig.horizontalBlock,
                      right: 20 * SizeConfig.horizontalBlock),
                  child: state.doctors.isEmpty
                      ? Center(
                          child: Text(
                          'No doctors with that specialization in that city.',
                          textAlign: TextAlign.center,
                          style: AppStyles
                              .color0xFF020D18FontSize12FontWeightW700
                              .copyWith(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                          ),
                        ))
                      : Column(
                          children: [
                            SizedBox(height: 10 * SizeConfig.verticalBlock),
                            Expanded(
                              child: GridView.builder(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent:
                                            150 * SizeConfig.horizontalBlock,
                                        mainAxisExtent:
                                            260 * SizeConfig.verticalBlock,
                                        mainAxisSpacing:
                                            10 * SizeConfig.verticalBlock,
                                        crossAxisSpacing:
                                            10 * SizeConfig.horizontalBlock),
                                itemBuilder: (_, index) => DoctorComponent(
                                  doctorModel: state.doctors[index],
                                ),
                                itemCount: state.doctors.length,
                              ),
                            ),
                            SizedBox(height: 10 * SizeConfig.verticalBlock),
                          ],
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
