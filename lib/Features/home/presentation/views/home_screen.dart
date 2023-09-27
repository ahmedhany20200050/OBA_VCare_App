import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/Features/all_doctors_screen/presentation/views/all_doctors_screen.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_states.dart';
import 'package:untitled/Features/home/presentation/views/widgets/home_body.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_cubit.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_states.dart';
import 'package:untitled/Features/search/presentation/views/search_screen.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/utils/snack_bar_viewer.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';

import '../../../../core/app_styles.dart';

class HomeScreen extends StatefulWidget {
  static String id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SnackBarViewer {
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
                        const AllDoctorsScreen(),
                        const SearchScreen(),
                        HistoryBody(),
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
                child: const Text("Logout")),
          )),
        ),
        body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarStates>(
          builder: (_, __) => IndexedStack(
            index: _currentIndex,
            children: const [
              HomeBody(),
              Text("Doctors"),
              SearchScreen(),
              Text("History"),
              UserProfile()
            ],
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarStates>(
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
  }
}


class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var historyList=BlocProvider.of<HomeCubit>(context).historyList;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'History',
              style: AppStyles.textStyle24w400inter,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: 60 * SizeConfig.horizontalBlock,
              child: const Divider(
                thickness: 2,
              ),
            ),
          ),
          SizedBox(
            height: 20 * SizeConfig.verticalBlock,
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: historyList.isEmpty ? 2 : historyList.length,
              itemBuilder: (context, index) => historyList.isEmpty
                  ? const SizedBox()
                  : historyList.length == 1
                  ? HistoryComponant(
                historyModel: historyList[0],
              )
                  : HistoryComponant(
                historyModel: historyList[index],
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10 * SizeConfig.verticalBlock,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

