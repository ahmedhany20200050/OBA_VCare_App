import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_states.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_state.dart';
import 'package:untitled/Features/home/presentation/views/widgets/home_body.dart';
import 'package:untitled/Features/search/presentation/views/search_screen.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        // var homeCbt = BlocProvider.of<HomeCubit>(context);
        return Scaffold(
            appBar: const CustomAppBar(),
            drawer: const Drawer(),
            body: BlocProvider.of<HomeCubit>(context).userModel == null
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : BlocBuilder<BottomNavigationBarCubit,
                    BottomNavigationBarStates>(
                    builder: (_, __) => IndexedStack(
                      index: _currentIndex,
                      children: [
                        HomeBody(
                          majorList:
                              BlocProvider.of<HomeCubit>(context).majorList,
                        ),
                        const Text("Doctors"),
                        SearchScreen(),
                        const Text("History"),
                        UserProfile(
                          userModel:
                              BlocProvider.of<HomeCubit>(context).userModel!,
                          historyList:
                              BlocProvider.of<HomeCubit>(context).historyList,
                        )
                      ],
                    ),
                  ),
            bottomNavigationBar: BlocBuilder<BottomNavigationBarCubit,
                BottomNavigationBarStates>(
              builder: (_, __) => BottomNavigationBar(
                onTap: (index) {
                  if (index != _currentIndex) {
                    _currentIndex = index;
                    BottomNavigationBarCubit.get(context).update();
                  }
                },
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                elevation: 0,
                selectedFontSize: 12 * SizeConfig.textRatio,
                selectedItemColor: AppColors.color0xFF173F68,
                unselectedFontSize: 12 * SizeConfig.textRatio,
                unselectedItemColor: AppColors.color0xFF173F68,
                showUnselectedLabels: true,
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.homeIcon,
                      width: 12.25 * SizeConfig.horizontalBlock,
                      height: 24 * SizeConfig.verticalBlock,
                    ),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.hospitalIcon,
                      width: 24 * SizeConfig.horizontalBlock,
                      height: 24 * SizeConfig.verticalBlock,
                    ),
                    label: 'Doctors',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8 * SizeConfig.horizontalBlock,
                          vertical: 8 * SizeConfig.verticalBlock),
                      decoration: ShapeDecoration(
                        color: AppColors.color0xFF173F68,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: SvgPicture.asset(
                        AppAssets.searchIcon,
                        width: 24 * SizeConfig.horizontalBlock,
                        height: 24 * SizeConfig.verticalBlock,
                      ),
                    ),
                    label: 'Search',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.clockIcon,
                      width: 24 * SizeConfig.horizontalBlock,
                      height: 24 * SizeConfig.verticalBlock,
                    ),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      AppAssets.accountIcon,
                      width: 24 * SizeConfig.horizontalBlock,
                      height: 24 * SizeConfig.verticalBlock,
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            ));
      },
    );
  }
}
