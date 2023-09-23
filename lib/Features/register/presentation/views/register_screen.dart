// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../manger/cubit/register_cubit.dart';
import '../manger/cubit/register_cubit_state.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          //todo: navigate
          // Navigator.of(context).pushNamed(HomeScreen.id);
          AnimatedSnackBar.material(
            'Register Success',
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 4),
          ).show(context);
        }
      },
      builder: (context, state) {
        var registerCubit = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
            body: state is RegisterCubitLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : state is RegisterCubitFailure
                    ? Center(
                        child: Text(state.errmsg),
                      )
                    : SafeArea(
                        child: SingleChildScrollView(
                          physics: const ClampingScrollPhysics(),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 24 * SizeConfig.horizontalBlock,
                                vertical: 55 * SizeConfig.verticalBlock),
                            child: Form(
                              key: formkey,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Let’s get started!",
                                      textAlign: TextAlign.center,
                                      style: AppStyles.titleStyle,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "create an account and start booking now.",
                                            style: AppStyles.descriptionStyle,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    TextFormField(
                                      controller: name,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'name must not be empty.';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        hintText: "Name",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: AppColors.textFieldColor)),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    TextFormField(
                                      controller: email,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Email must not be empty.';
                                        } else if (!value.contains('@')) {
                                          return 'Email must contain @ .';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        hintText: "Email",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: AppColors.textFieldColor
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.textFieldColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'phone must not be empty.';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        hintText: "Phone",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: AppColors.textFieldColor
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.textFieldColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      controller: password,
                                      validator: (value) {
                                        if (value!.length < 8 || value.isEmpty) {
                                          return 'Password must be more than or equal 8 characters.';
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        hintText: "Password",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: AppColors.textFieldColor
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.textFieldColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24*SizeConfig.verticalBlock,
                                    ),
                                    TextFormField(
                                      obscureText: true,
                                      controller: confirmPassword,
                                      validator: (value) {
                                        if (value != password.text) {
                                          return "password mismatch";
                                        }
                                      },
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        hintText: "Confirm Password",
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                width: 2,
                                                color: AppColors.textFieldColor
                                            )
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(4),
                                          borderSide: const BorderSide(
                                            color: AppColors.textFieldColor,
                                            width: 1,
                                          ),
                                        ),
                                      ),
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
                                        const Text("Male"),
                                        SizedBox(
                                          width: 8 * SizeConfig.horizontalBlock,
                                        ),
                                        Checkbox(
                                            activeColor: AppColors.primaryColor,
                                            value: !isMale,
                                            onChanged: (value) {
                                              setState(() {
                                                isMale = false;
                                              });
                                            }),
                                        const Text("Female"),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                      const  Text("Already have account?"),
                                        Text("Login here",style: AppStyles.homeProgressStyle.copyWith(
                                          fontSize: 12
                                        ),),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 48 * SizeConfig.verticalBlock,
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            )),
                                        onPressed: () async {
                                          if (formkey.currentState!.validate()) {
                                            await registerCubit.register(
                                              name: name.text,
                                              phone: phone.text,
                                              email: email.text,
                                              password: password.text,
                                              confirmPassword: confirmPassword.text,
                                              isMale: isMale,
                                            );
                                          }
                                        },
                                        child: Text(
                                          "Register",
                                          textAlign: TextAlign.center,
                                          style: AppStyles.buttonTextStyle,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ));
      },
    );
  }
}
