import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/login/presentation/views/login_screen.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_cubit.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_states.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: AppColors.color0xFFF3FAF9,
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      title: Text(
        'VCare',
        style: AppStyles.color0xFFF3FAF9FontSize20FontWeightW500,
      ),
      leading: Center(
          child: BlocListener<LogoutCubit, LogoutStates>(
        listener: (_, state) {
          if (state is LogoutSuccessState) {
            BlocProvider.of<HomeCubit>(context).userModel = null;
            Navigator.pushReplacementNamed(context, LoginScreen.id);
            AnimatedSnackBar.material(
              'Logged out Successfully',
              type: AnimatedSnackBarType.success,
              duration: const Duration(seconds: 2),
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
                        child: CircularProgressIndicator.adaptive(
                      backgroundColor: AppColors.colorWhite,
                    )));
          }
        },
        child: IconButton(
            onPressed: () {
              LogoutCubit.get(context).logout();
            },
            icon: const Icon(Icons.logout)),
      )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(45 * SizeConfig.verticalBlock);
}
