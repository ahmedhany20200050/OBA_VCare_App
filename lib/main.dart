import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:untitled/Features/user_profile_edit/presentation/manager/cubits/update_user_cubit.dart';
import 'package:untitled/core/helpers/app_router.dart';
import 'package:untitled/Features/Splash/presentation/views/splash_screen.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_cubit.dart';
import 'package:untitled/Features/history_details/presentation/manger/cubit/history_details_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_governments/get_all_governments_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_cubit.dart';
import 'package:untitled/Features/login/presentation/manger/cubit/login_cubit.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_cubit.dart';
import 'package:untitled/Features/register/presentation/manger/cubit/register_cubit.dart';
import 'package:untitled/core/helpers/observer.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';

void main() {
  Bloc.observer = Observer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..allMajors()
            ..userProfile()
            ..getHistory(),
        ),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => DoctorDetailsCubit()),
        BlocProvider(
          create: (context) => HistoryDetailsCubit(),
        ),
        BlocProvider(create: (context) => GetDoctorsCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => CitiesOfGovernmentCubit()),
        BlocProvider(create: (context) => GetAllGovernmentsCubit()),
        BlocProvider(create: (context) => GetAllSpecializationCubit()),
        BlocProvider(create: (context) => FilterDoctorCubit()),
        BlocProvider<BottomNavigationBarCubit>(
            create: (context) => BottomNavigationBarCubit()),
        BlocProvider<UpdateUserCubit>(create: (context) => UpdateUserCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter.generatedRoutes,
        initialRoute: SplashScreen.id,
      ),
    );
  }
}
