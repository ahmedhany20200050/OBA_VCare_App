// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_state.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_cubit.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_cubit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:untitled/Features/filter_doctors/presentation/views/filter_doctors_screen.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_states.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_cubit.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_states.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/radio_button/radio_button_cubit.dart';
// import 'package:untitled/Features/home/presentation/manager/cubits/radio_button/radio_button_states.dart';
// import 'package:untitled/Features/home/presentation/views/widgets/custom_expansion_tile.dart';
// import 'package:untitled/core/app_styles.dart';
// import 'package:untitled/core/widgets/text_and_icon_component.dart';
// import 'package:untitled/core/app_colors.dart';
// import 'package:untitled/core/utils/app_assets.dart';
// import 'package:untitled/core/widgets/custom_button.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/Features/home/presentation/views/widgets/major_component.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  // int? _cityId;
  // int? _specializationId;

  @override
  void initState() {
    super.initState();
    // CitiesOfGovernmentCubit.get(context).getAllCities();
    // GetAllSpecializationCubit.get(context).getAllSpecialization();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (_, __) => BlocProvider.of<HomeCubit>(context).userModel == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10 * SizeConfig.horizontalBlock),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          BlocProvider.of<HomeCubit>(context).majorList.length,
                      itemBuilder: (context, index) => MajorComponent(
                        majorModel: BlocProvider.of<HomeCubit>(context)
                            .majorList[index],
                      ),
                    ),
                    SizedBox(height: 10 * SizeConfig.verticalBlock),
                  ],
                ),
              ),
            ),
    );
  }
}
