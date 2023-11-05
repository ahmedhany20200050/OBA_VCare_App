// ignore_for_file: deprecated_member_use
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Features/all_doctors_screen/presentation/views/all_doctors_screen.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_states.dart';
import 'package:untitled/Features/home/presentation/views/widgets/home_body.dart';
import 'package:untitled/Features/search/presentation/views/search_screen.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
import 'package:untitled/core/utils/app_assets.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/utils/snack_bar_viewer.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import '../manager/cubits/cubit/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  static const id = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SnackBarViewer, AutomaticKeepAliveClientMixin<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).allMajors();
    BlocProvider.of<HomeCubit>(context).userProfile();
    BlocProvider.of<HomeCubit>(context).getHistory();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarStates>(
        builder: (_, __) => IndexedStack(
          index: _currentIndex,
          children: [
            const HomeBody(),
            const AllDoctorsScreen(),
            const SearchScreen(),
            UserProfile(
              userModel: BlocProvider.of<HomeCubit>(context).userModel,
              historyList: BlocProvider.of<HomeCubit>(context).historyList,
            )
          ],
        ),
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarStates>(
        builder: (_, __) => CurvedNavigationBar(
          height: 50,
          index: _currentIndex,
          backgroundColor: AppColors.primaryColor,
          items: [
            SvgPicture.asset(
              AppAssets.homeIcon,
              width: 12.25 * SizeConfig.horizontalBlock,
              height: 24 * SizeConfig.verticalBlock,
              color: AppColors.primaryColor,
            ),
            const Icon(FontAwesomeIcons.stethoscope,
                color: AppColors.primaryColor),
            SvgPicture.asset(
              AppAssets.searchIcon,
              width: 24 * SizeConfig.horizontalBlock,
              height: 24 * SizeConfig.verticalBlock,
              color: AppColors.primaryColor,
            ),
            SvgPicture.asset(
              AppAssets.accountIcon,
              width: 24 * SizeConfig.horizontalBlock,
              height: 24 * SizeConfig.verticalBlock,
              color: AppColors.primaryColor,
            ),
          ],
          onTap: (index) {
            if (index != _currentIndex) {
              _currentIndex = index;
              BottomNavigationBarCubit.get(context).update();
            }
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
