import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Scaffold(
        appBar: const CustomAppBar(),
        drawer: Drawer(
          child: Center(
              child: BlocListener<LogoutCubit, LogoutStates>(
            listener: (_, state) {
              if (state is LogoutSuccessState) {
                Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (Route<dynamic> route) => false);
                AnimatedSnackBar.material(
                  'Logged out Successfully',
                  type: AnimatedSnackBarType.success,
                  duration: const Duration(seconds: 4),
                ).show(context);
              } else if (state is LogoutFailureState) {
                AnimatedSnackBar.material(
                  'Error Logging out',
                  type: AnimatedSnackBarType.error,
                  duration: const Duration(seconds: 4),
                ).show(context);
              } else {
                showDialog(
                    context: context,
                    builder: (_) => const Center(
                        child: CircularProgressIndicator.adaptive()));
              }
            },
            child: TextButton(
                onPressed: () {
                  LogoutCubit.get(context).logout();
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
