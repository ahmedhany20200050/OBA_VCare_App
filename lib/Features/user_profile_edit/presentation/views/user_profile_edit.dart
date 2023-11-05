import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/Features/user_profile_edit/presentation/manager/cubits/update_user_cubit.dart';
import 'package:untitled/Features/user_profile_edit/presentation/manager/cubits/update_user_states.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_text_form_field.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});
  static const id = "UserProfileEdit";

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.colorWhite,
        backgroundColor: AppColors.primaryColor,
      ),
      body: BlocListener<UpdateUserCubit, UpdateUserStates>(
        listener: (context, state) {
          if (state is UpdateUserSuccessState) {
            AnimatedSnackBar.material(
              'User updated Successfully',
              type: AnimatedSnackBarType.success,
              duration: const Duration(seconds: 2),
            ).show(context);
            BlocProvider.of<HomeCubit>(context).userProfile();
            Navigator.pop(context);
          } else if (state is UpdateUserErrorState) {
            AnimatedSnackBar.material(
              state.errorMessage,
              type: AnimatedSnackBarType.error,
              duration: const Duration(seconds: 4),
            ).show(context);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16 * SizeConfig.horizontalBlock,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    'Update details!',
                    style: AppStyles.textStyle34w400roboto,
                  ),
                  SizedBox(
                    height: 5 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    'Update your info and become a new you!',
                    textAlign: TextAlign.center,
                    style: AppStyles.textStyle34w400roboto.copyWith(
                      fontSize: 16 * SizeConfig.textRatio,
                      color: AppColors.colorBlack.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    controller: name,
                    hintText: 'Name',
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    controller: email,
                    hintText: 'Email',
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    controller: phone,
                    hintText: 'Phone',
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    controller: password,
                    hintText: 'Password',
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  CustomTextFormField(
                    controller: passwordConfirm,
                    hintText: 'Password Confirm',
                    validator: (p0) {
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: AppColors.primaryColor,
                          value: isMale,
                          onChanged: (value) {
                            setState(() {
                              isMale = true;
                            });
                          }),
                      Text(
                        "Male",
                        style: AppStyles.textStyle34w400roboto.copyWith(
                          fontSize: 16 * SizeConfig.textRatio,
                        ),
                      ),
                      SizedBox(
                        width: 20 * SizeConfig.horizontalBlock,
                      ),
                      Checkbox(
                          activeColor: AppColors.primaryColor,
                          value: !isMale,
                          onChanged: (value) {
                            setState(() {
                              isMale = false;
                            });
                          }),
                      Text(
                        "Female",
                        style: AppStyles.textStyle34w400roboto.copyWith(
                          fontSize: 16 * SizeConfig.textRatio,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  SizedBox(
                    height: 48 * SizeConfig.verticalBlock,
                    width: 312 * SizeConfig.horizontalBlock,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          )),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          UpdateUserCubit.get(context).updateUser(
                              name: name.text,
                              email: email.text,
                              phone: phone.text,
                              password: password.text,
                              passwordConfirm: passwordConfirm.text,
                              gender: isMale ? '0' : '1');
                        }
                      },
                      child: Text(
                        "UPDATE",
                        textAlign: TextAlign.center,
                        style: AppStyles.buttonTextStyle,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
