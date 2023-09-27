import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/all_doctors_screen/presentation/views/all_doctors_screen.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_cubit.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/views/doctor_details.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/first_on_boarding_screen.dart';
import 'package:untitled/Features/OnBoarding/presentation/views/second_on_boarding_screen.dart';
import 'package:untitled/Features/Splash/presentation/views/splash_screen.dart';
import 'package:untitled/Features/history_details/presentation/manger/cubit/history_details_cubit.dart';
import 'package:untitled/Features/history_details/presentation/views/history_details_screen.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_cubit.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/home/presentation/views/home_screen.dart';
import 'package:untitled/Features/login/presentation/manger/cubit/login_cubit.dart';
// import 'package:untitled/Features/login/presentation/views/all_doctors_screen.dart';
import 'package:untitled/Features/register/presentation/manger/cubit/register_cubit.dart';
import 'package:untitled/Features/success_state/view/success_screen.dart';
import 'package:untitled/Features/user_profile_edit/presentation/views/user_profile_edit.dart';
import 'package:untitled/Features/search/presentation/manger/cubit/search_cubit.dart';
import 'package:untitled/Features/search/presentation/views/search_screen.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
// import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
// import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/helpers/observer.dart';
import 'package:untitled/core/utils/size_config.dart';

import 'Features/login/presentation/views/login_screen.dart';
import 'Features/register/presentation/views/register_screen.dart';

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
        BlocProvider(create: (context) => HomeCubit()..allMajors()..userProfile()..getHistory()),
        BlocProvider(create: (context) => RegisterCubit()),
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => DoctorDetailsCubit()),
        BlocProvider(create: (context) => HistoryDetailsCubit(),),
        BlocProvider(create: (context) => GetDoctorsCubit()),
        BlocProvider<BottomNavigationBarCubit>(
            create: (context) => BottomNavigationBarCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => const LoginScreen(),
          RegisterScreen.id: (context) => const RegisterScreen(),
          SplashScreen.id: (context) => SplashScreen(),
          FirstOnBoardingScreen.id: (context) => const FirstOnBoardingScreen(),
          SecondOnBoardingScreen.id: (context) =>
              const SecondOnBoardingScreen(),
          HomeScreen.id: (context) => const HomeScreen(),
          DoctorDetails.id: (context) => const DoctorDetails(),
          // UserProfile.id: (context) => const UserProfile(),
          SuccessStateScreen.id: (context) => const SuccessStateScreen(),
          UserProfileEdit.id: (context) => const UserProfileEdit(),
          // UserProfile.id:(context) => const UserProfile(),
          SearchScreen.id:(context) => const SearchScreen(),
          HistoryDetails.id:(context) => const HistoryDetails(),
          AllDoctorsScreen.id:(context) => const AllDoctorsScreen(),
        },
      ),
    );
  }
}
