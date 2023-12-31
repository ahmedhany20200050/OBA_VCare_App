// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../manger/cubit/login_cubit.dart';
import '../manger/cubit/login_cubit_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String errors(state, String error) {
    if (state is LoginCubitFailure) {
      if (state.err.containsKey(error)) {
        // print(state.err['email'][0].toString());
        return state.err[error][0].toString();
      }
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginCubitState>(
      listener: (context, state) {
        if (state is LoginCubitSuccess) {
          Navigator.of(context).pushReplacementNamed(HomeScreen.id);
          AnimatedSnackBar.material(
            'Login Success',
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 2),
          ).show(context);
        }
        if (state is LoginCubitFailure) {
          if (state.err.containsKey('error')) {
            // print(state.err['error'].toString());
            AnimatedSnackBar.material(
              state.err['error'].toString().replaceAll("Exception:", " "),
              type: AnimatedSnackBarType.error,
              duration: const Duration(seconds: 4),
            ).show(context);
          }
        }
      },
      builder: (context, state) {
        var loginCubit = BlocProvider.of<LoginCubit>(context);
        return Scaffold(
            body: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 25 * SizeConfig.horizontalBlock,
                  vertical: 20 * SizeConfig.verticalBlock),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/gif.gif'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Login to an account and start booking doctors now",
                              style: AppStyles.descriptionStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email,
                              color: AppColors.primaryColor),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintText: "Email",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.primaryColor)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      state is LoginCubitFailure
                          ? Text(
                              errors(state, "email"),
                              style: AppStyles.textFieldErrorStyle,
                            )
                          : Container(),
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: password,
                        obscureText: loginCubit.obscure,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock,
                              color: AppColors.primaryColor),
                          suffixIcon: IconButton(
                              onPressed: () => loginCubit.changeVisability(),
                              icon: loginCubit.visabl),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 16),
                          hintText: "Password",
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2, color: AppColors.primaryColor)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      state is LoginCubitFailure
                          ? Text(
                              errors(state, 'password'),
                              style: AppStyles.textFieldErrorStyle,
                            )
                          : Container(),
                      SizedBox(
                        height: 20 * SizeConfig.verticalBlock,
                      ),
                      Row(
                        children: [
                          const Text("No account yet?"),
                          SizedBox(width: 10 * SizeConfig.horizontalBlock),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.id);
                            },
                            child: Text(
                              "Register here",
                              style: AppStyles.calendarDayNamesStyle
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15 * SizeConfig.verticalBlock,
                      ),
                      SizedBox(
                        height: 48 * SizeConfig.verticalBlock,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              )),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              await loginCubit.login(
                                email: email.text,
                                password: password.text,
                              );
                            }
                          },
                          child: state is LoginCubitLoading
                              ? const Center(
                                  child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.colorWhite,
                                      )),
                                )
                              : Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: AppStyles.buttonTextStyle
                                      .copyWith(fontWeight: FontWeight.bold),
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
