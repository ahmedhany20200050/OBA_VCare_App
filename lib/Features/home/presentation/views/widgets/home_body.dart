import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_state.dart';
import 'package:untitled/Features/home/presentation/views/widgets/custom_expansion_tile.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/widgets/text_and_icon_component.dart';
import 'package:untitled/Features/home/presentation/views/widgets/major_component.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (_, __) => BlocProvider.of<HomeCubit>(context).userModel == null
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Padding(
              padding: EdgeInsets.only(
                  top: 16 * SizeConfig.verticalBlock,
                  left: 16 * SizeConfig.horizontalBlock,
                  right: 16 * SizeConfig.horizontalBlock),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomButton(
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
                          builder: (_) => ListView(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        top: 32 * SizeConfig.verticalBlock,
                                        left: 20 * SizeConfig.horizontalBlock,
                                        right: 20 * SizeConfig.horizontalBlock),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextAndIconComponent(
                                              text: "FILTER",
                                              iconAsset: AppAssets.filterIcon,
                                              iconColor: AppColors.primaryColor,
                                              textStyle: AppStyles
                                                  .color0xFF173F68FontSize12FontWeightW400,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: SvgPicture.asset(
                                                AppAssets.xIcon,
                                                width: 24 *
                                                    SizeConfig.horizontalBlock,
                                                height: 24 *
                                                    SizeConfig.verticalBlock,
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 30 * SizeConfig.verticalBlock,
                                        ),
                                        const CustomExpansionTile(
                                            title: "CITY"),
                                        const CustomExpansionTile(
                                            title: "GOVERNORATE"),
                                        const CustomExpansionTile(
                                            title: "SPECIALIZATION"),
                                        SizedBox(
                                          height: 35 * SizeConfig.verticalBlock,
                                        ),
                                        CustomButton(
                                            verticalPadding:
                                                16 * SizeConfig.verticalBlock,
                                            buttonText: "APPLY",
                                            onTap: () {})
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                    },
                    iconAsset: AppAssets.filterIcon,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount:
                          BlocProvider.of<HomeCubit>(context).majorList.length,
                      itemBuilder: (context, index) => MajorComponent(
                        majorModel: BlocProvider.of<HomeCubit>(context)
                            .majorList[index],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
