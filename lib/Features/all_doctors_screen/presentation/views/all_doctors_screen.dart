// ignore_for_file: body_might_complete_normally_nullable, deprecated_member_use
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/major_model.dart' as basel;
import 'package:untitled/Features/home/presentation/views/widgets/doctor_component.dart';
import '../../../../core/app_colors.dart';
import '../../../search/data/all_doctors_response.dart';
import '../../../search/presentation/manger/cubit/search_cubit.dart';
import '../../../search/presentation/manger/cubit/search_cubit_state.dart';

import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Features/filter_doctors/presentation/views/filter_doctors_screen.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_states.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_states.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/radio_button/radio_button_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/radio_button/radio_button_states.dart';
import 'package:untitled/Features/home/presentation/views/widgets/custom_expansion_tile.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/widgets/text_and_icon_component.dart';
// import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_button.dart';

class AllDoctorsScreen extends StatefulWidget {
  const AllDoctorsScreen({super.key});
  static const id = 'AllDoctorsScreen';

  @override
  State<AllDoctorsScreen> createState() => _AllDoctorsScreenState();
}

class _AllDoctorsScreenState extends State<AllDoctorsScreen> {
  int? _cityId;
  int? _specializationId;
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController search = TextEditingController();
  List<Data> doctorsList = [];

  @override
  void initState() {
    CitiesOfGovernmentCubit.get(context).getAllCities();
    GetAllSpecializationCubit.get(context).getAllSpecialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDoctorsCubit, GetDoctorsCubitState>(
      listener: (context, state) {
        if (state is GetDoctorsCubitInitial) {
          BlocProvider.of<GetDoctorsCubit>(context).getAllDoctors();
        }
        if (state is GetDoctorsCubitFailure) {
          AnimatedSnackBar.material(
            state.err.toString().replaceAll("Exception:", " "),
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 4),
          ).show(context);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<GetDoctorsCubit>(context);
        return state is GetDoctorsCubitLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : state is GetDoctorsCubitSuccess
                ? (cubit.doctors.data?.isEmpty ?? true)
                    ? const Center(
                        child: Text("No Doctors Available"),
                      )
                    : Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          GridView.count(
                            padding: const EdgeInsets.all(16),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.54,
                            crossAxisCount: 2,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            children: buildDoctorsItems(cubit.doctors),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: CustomButton(
                              buttonText: "Filter",
                              mustBeMaxSize: false,
                              verticalPadding: 12 * SizeConfig.verticalBlock,
                              onTap: () {
                                showModalBottomSheet(
                                    backgroundColor: AppColors.color0xFFF3FAF9,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: SizeConfig.horizontalBlock,
                                          color: AppColors.color0xFF020D18),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return ListView(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 32 *
                                                    SizeConfig.verticalBlock,
                                                left: 20 *
                                                    SizeConfig.horizontalBlock,
                                                right: 20 *
                                                    SizeConfig.horizontalBlock),
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    TextAndIconComponent(
                                                      text: "FILTER",
                                                      iconAsset:
                                                          AppAssets.filterIcon,
                                                      iconColor: AppColors
                                                          .primaryColor,
                                                      textStyle: AppStyles
                                                          .color0xFF173F68FontSize12FontWeightW400,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        _cityId = null;
                                                        _specializationId =
                                                            null;
                                                        Navigator.pop(context);
                                                      },
                                                      child: SvgPicture.asset(
                                                        AppAssets.xIcon,
                                                        width: 18 *
                                                            SizeConfig
                                                                .horizontalBlock,
                                                        height: 18 *
                                                            SizeConfig
                                                                .verticalBlock,
                                                        color: AppColors
                                                            .colorBlack,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10 *
                                                      SizeConfig.verticalBlock,
                                                ),
                                                BlocConsumer<
                                                        CitiesOfGovernmentCubit,
                                                        CitiesOfGovernmentStates>(
                                                    listener: (_, state) {
                                                      if (state
                                                          is CitiesOfGovernmentSuccessState) {
                                                        _cityId =
                                                            state.cities[0].id!;
                                                      }
                                                    },
                                                    listenWhen: (previous,
                                                            current) =>
                                                        current
                                                            is CitiesOfGovernmentSuccessState,
                                                    builder: (_, state) {
                                                      if (state
                                                          is CitiesOfGovernmentSuccessState) {
                                                        if (state
                                                            .cities.isEmpty) {
                                                          return const Center(
                                                            child: Text(
                                                                "No Cities"),
                                                          );
                                                        }
                                                        return BlocProvider<
                                                            RadioButtonCubit>(
                                                          create: (_) =>
                                                              RadioButtonCubit(),
                                                          child:
                                                              CustomExpansionTile(
                                                            title: "CITY",
                                                            children: List.generate(
                                                                state.cities.length,
                                                                (index) => Container(
                                                                    padding: EdgeInsets.symmetric(horizontal: 10 * SizeConfig.horizontalBlock),
                                                                    child: Row(
                                                                      children: [
                                                                        BlocBuilder<
                                                                            RadioButtonCubit,
                                                                            RadioButtonStates>(
                                                                          builder: (context, __) =>
                                                                              Radio.adaptive(
                                                                            activeColor:
                                                                                AppColors.primaryColor,
                                                                            splashRadius:
                                                                                5 * SizeConfig.textRatio,
                                                                            materialTapTargetSize:
                                                                                MaterialTapTargetSize.shrinkWrap,
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            onChanged:
                                                                                (value) {
                                                                              _cityId = value!;
                                                                              RadioButtonCubit.get(context).changeSelectedValue();
                                                                            },
                                                                            value:
                                                                                state.cities[index].id,
                                                                            groupValue:
                                                                                _cityId,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5 * SizeConfig.horizontalBlock,
                                                                        ),
                                                                        Text(
                                                                          state
                                                                              .cities[index]
                                                                              .name!,
                                                                          style:
                                                                              AppStyles.color0xFF020D18FontSize12FontWeightW400,
                                                                        )
                                                                      ],
                                                                    ))),
                                                          ),
                                                        );
                                                      } else if (state
                                                          is CitiesOfGovernmentErrorState) {
                                                        return Center(
                                                          child: Text(state
                                                              .errorMessage),
                                                        );
                                                      } else {
                                                        return const CircularProgressIndicator
                                                            .adaptive();
                                                      }
                                                    }),
                                                // BlocConsumer<GetAllGovernmentsCubit,
                                                //     GetAllGovernmentsStates>(
                                                // listener: (context, state) {
                                                //   if (state
                                                //       is GetAllGovernmentsSuccessState) {
                                                //     _governmentId =
                                                //         state.governments[0].id;
                                                //   }
                                                // },
                                                // listenWhen: (previous, current) =>
                                                //     current
                                                //         is GetAllGovernmentsSuccessState,
                                                // builder: (context, state) {
                                                //   if (state
                                                //       is GetAllGovernmentsSuccessState) {
                                                //     return BlocProvider<
                                                //         RadioButtonCubit>(
                                                //       create: (context) =>
                                                //           RadioButtonCubit(),
                                                //       child: CustomExpansionTile(
                                                //         title: "GOVERNORATE",
                                                //         children: List.generate(
                                                //             state
                                                //                 .governments.length,
                                                //             (index) => Container(
                                                //                 padding: EdgeInsets.symmetric(
                                                //                     horizontal: 10 *
                                                //                         SizeConfig
                                                //                             .horizontalBlock),
                                                //                 child: Row(
                                                //                   children: [
                                                //                     BlocBuilder<
                                                //                         RadioButtonCubit,
                                                //                         RadioButtonStates>(
                                                //                       builder: (context,
                                                //                               __) =>
                                                //                           Radio
                                                //                               .adaptive(
                                                //                         activeColor:
                                                //                             AppColors
                                                //                                 .primaryColor,
                                                //                         splashRadius: 5 *
                                                //                             SizeConfig
                                                //                                 .textRatio,
                                                //                         materialTapTargetSize:
                                                //                             MaterialTapTargetSize
                                                //                                 .shrinkWrap,
                                                //                         visualDensity:
                                                //                             VisualDensity
                                                //                                 .compact,
                                                //                         onChanged:
                                                //                             (value) {
                                                //                           _governmentId =
                                                //                               value!;
                                                //                           RadioButtonCubit.get(
                                                //                                   context)
                                                //                               .changeSelectedValue();
                                                //                         },
                                                //                         value: state
                                                //                             .governments[
                                                //                                 index]
                                                //                             .id,
                                                //                         groupValue:
                                                //                             _governmentId,
                                                //                       ),
                                                //                     ),
                                                //                     SizedBox(
                                                //                       width: 5 *
                                                //                           SizeConfig
                                                //                               .horizontalBlock,
                                                //                     ),
                                                //                     Text(
                                                //                       state
                                                //                           .governments[
                                                //                               index]
                                                //                           .name,
                                                //                       style: AppStyles
                                                //                           .color0xFF020D18FontSize12FontWeightW400,
                                                //                     )
                                                //                   ],
                                                //                 ))),
                                                //       ),
                                                //     );
                                                //   } else if (state
                                                //       is GetAllGovernmentsErrorState) {
                                                //     return Center(
                                                //       child:
                                                //           Text(state.errorMessage),
                                                //     );
                                                //   } else {
                                                //     return const CircularProgressIndicator
                                                //         .adaptive();
                                                //   }
                                                // }),
                                                BlocConsumer<
                                                        GetAllSpecializationCubit,
                                                        GetAllSpecializationStates>(
                                                    listener: (context, state) {
                                                      if (state
                                                          is GetAllSpecializationSuccessState) {
                                                        _specializationId = state
                                                            .specializations[0]
                                                            .id!;
                                                      }
                                                    },
                                                    listenWhen: (previous,
                                                            current) =>
                                                        current
                                                            is GetAllSpecializationSuccessState,
                                                    builder: (_, state) {
                                                      if (state
                                                          is GetAllSpecializationSuccessState) {
                                                        return BlocProvider<
                                                            RadioButtonCubit>(
                                                          create: (context) =>
                                                              RadioButtonCubit(),
                                                          child:
                                                              CustomExpansionTile(
                                                            title:
                                                                "SPECIALIZATION",
                                                            children: List.generate(
                                                                state.specializations.length,
                                                                (index) => Container(
                                                                    padding: EdgeInsets.symmetric(horizontal: 10 * SizeConfig.horizontalBlock),
                                                                    child: Row(
                                                                      children: [
                                                                        BlocBuilder<
                                                                            RadioButtonCubit,
                                                                            RadioButtonStates>(
                                                                          builder: (context, __) =>
                                                                              Radio.adaptive(
                                                                            activeColor:
                                                                                AppColors.primaryColor,
                                                                            splashRadius:
                                                                                5 * SizeConfig.textRatio,
                                                                            materialTapTargetSize:
                                                                                MaterialTapTargetSize.shrinkWrap,
                                                                            visualDensity:
                                                                                VisualDensity.compact,
                                                                            onChanged:
                                                                                (value) {
                                                                              _specializationId = value!;
                                                                              RadioButtonCubit.get(context).changeSelectedValue();
                                                                            },
                                                                            value:
                                                                                state.specializations[index].id,
                                                                            groupValue:
                                                                                _specializationId,
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5 * SizeConfig.horizontalBlock,
                                                                        ),
                                                                        Text(
                                                                          state
                                                                              .specializations[index]
                                                                              .name!,
                                                                          style:
                                                                              AppStyles.color0xFF020D18FontSize12FontWeightW400,
                                                                        )
                                                                      ],
                                                                    ))),
                                                          ),
                                                        );
                                                      } else if (state
                                                          is GetAllSpecializationErrorState) {
                                                        return Center(
                                                          child: Text(state
                                                              .errorMessage),
                                                        );
                                                      } else {
                                                        return const CircularProgressIndicator
                                                            .adaptive();
                                                      }
                                                    }),
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 20),
                                                  child: CustomButton(
                                                      verticalPadding: 16 *
                                                          SizeConfig
                                                              .verticalBlock,
                                                      buttonText: "APPLY",
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            FilterDoctorsScreen
                                                                .id);
                                                        FilterDoctorCubit.get(
                                                                context)
                                                            .filterDoctor(
                                                          cityId: _cityId,
                                                          specializationId:
                                                              _specializationId,
                                                        );
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              iconAsset: AppAssets.filterIcon,
                            ),
                          ),
                        ],
                      )
                : state is GetDoctorsCubitFailure
                    ? Center(child: Text(state.err))
                    : Container();
      },
    );
  }

  List<Widget> buildDoctorsItems(AllDoctorsResponse doctors) {
    List<Widget> list = [];
    List<Data> data = doctors.data ?? [];
    for (var item in data) {
      list.add(SizedBox(
        child: DoctorComponent(
          doctorModel: basel.Doctors(
              name: item.name,
              id: item.id,
              address: item.address,
              appointPrice: item.appointPrice,
              degree: item.degree,
              description: item.description,
              email: item.email,
              endTime: item.endTime,
              gender: item.gender,
              phone: item.phone,
              photo: item.photo,
              specialization: basel.Specialization(
                  id: item.specialization?.id, name: item.specialization?.name),
              startTime: item.startTime),
        ),
      ));
    }
    return list;
  }
}
