import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/views/doctor_details.dart';
import 'package:untitled/Features/login/presentation/manger/cubit/login_cubit.dart';
// import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/Features/register/presentation/manger/cubit/register_cubit.dart';
// import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
// import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/utils/size_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegisterCubit()),
          BlocProvider(create: (context) => LoginCubit()),
        ],
        child: const DoctorDetails(),
      ),
    );
  }
}
