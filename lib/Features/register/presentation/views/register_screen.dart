// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../home/presentation/views/home_screen.dart';
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

  String errors(state, String error) {
    if (state is RegisterCubitFailure) {
      if (state.errmsg.containsKey(error)) {
        // print(state.err['email'][0].toString());
        return state.errmsg[error][0].toString();
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          //todonavigate
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
          AnimatedSnackBar.material(
            'Register Success',
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 4),
          ).show(context);
        }

        if (state is RegisterCubitFailure) {
          if (state.errmsg.containsKey('error')) {
            // print(state.err['error'].toString());
            AnimatedSnackBar.material(
              state.errmsg['error'].toString().replaceAll("Exception:", " "),
              type: AnimatedSnackBarType.error,
              duration: const Duration(seconds: 4),
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        var registerCubit = BlocProvider.of<RegisterCubit>(context);
        return Scaffold(
            body: state is RegisterCubitLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SafeArea(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 24 * SizeConfig.horizontalBlock,
                            vertical: 20 * SizeConfig.verticalBlock),
                        child: Form(
                          key: formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/gif.gif'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "create an account and start booking doctors now",
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
                                    prefixIcon: const Icon(Icons.person,
                                        color: AppColors.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Name",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(),
                                    ),
                                  ),
                                ),
                                state is RegisterCubitFailure
                                    ? Text(
                                        errors(state, "name"),
                                        style: AppStyles.textFieldErrorStyle,
                                      )
                                    : Container(),
                                const SizedBox(
                                  height: 24,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: email,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email must not be empty.';
                                    } else if (!value.contains('@')) {
                                      return 'Email must contain @ .';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.email,
                                        color: AppColors.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Email",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                state is RegisterCubitFailure
                                    ? Text(
                                        errors(state, "email"),
                                        style: AppStyles.textFieldErrorStyle,
                                      )
                                    : Container(),
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
                                    prefixIcon: const Icon(Icons.phone,
                                        color: AppColors.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Phone",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                state is RegisterCubitFailure
                                    ? Text(
                                        errors(state, "phone"),
                                        style: AppStyles.textFieldErrorStyle,
                                      )
                                    : Container(),
                                const SizedBox(height: 24),
                                TextFormField(
                                  controller: password,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password must not be empty.';
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock,
                                        color: AppColors.primaryColor),
                                    suffixIcon: const Icon(Icons.visibility_off,
                                        color: AppColors.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Password",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                TextFormField(
                                  controller: confirmPassword,
                                  validator: (value) {
                                    if (value != password.text) {
                                      return "password mismatch";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.lock,
                                        color: AppColors.primaryColor),
                                    suffixIcon: const Icon(Icons.visibility_off,
                                        color: AppColors.primaryColor),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    hintText: "Confirm Password",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 2,
                                            color: AppColors.primaryColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(4),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10 * SizeConfig.verticalBlock),
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
                                SizedBox(height: 10 * SizeConfig.verticalBlock),
                                Row(
                                  children: [
                                    const Text("Already have account?"),
                                    SizedBox(
                                        width: 10 * SizeConfig.horizontalBlock),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        "Login here",
                                        style: AppStyles.calendarDayNamesStyle
                                            .copyWith(
                                                color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20 * SizeConfig.verticalBlock),
                                SizedBox(
                                  height: 48 * SizeConfig.verticalBlock,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
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
                                      style: AppStyles.buttonTextStyle.copyWith(
                                          fontWeight: FontWeight.bold),
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
