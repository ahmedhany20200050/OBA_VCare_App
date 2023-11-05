// ignore_for_file: missing_required_param, prefer_typing_uninitialized_variables
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/core/app_colors.dart';
import '../../../../../core/utils/endpoints.dart';
import 'login_cubit_state.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginCubitState> {
  LoginCubit() : super(LoginCubitInitial());
  late String token;
  var loginData;
  Future login(
      {required String email,
      required String password,
     }) async {
    emit(LoginCubitLoading());
    try {
      http.Response response;
      response = await http.post(
        Uri.parse(EndPoints.baseUrl + EndPoints.loginEndpoint),
        body: {
          'email': email,
          'password': password,
        },
      );
      var data = jsonDecode(response.body);
      loginData = data['data'];
      if (response.statusCode >= 200 && response.statusCode < 300) {
        token = data['data']['token'];
        var storage = const FlutterSecureStorage();
        await storage.write(key: "token", value: token);
        emit(LoginCubitSuccess());
      } else if (response.statusCode == 422) {
        emit(LoginCubitFailure(err: loginData));
      } else {
        throw Exception(response.reasonPhrase.toString());
      }
    } on Exception catch (e) {
      emit(LoginCubitFailure(err: {
        'error': e.toString(),
      }));
    }
  }

Icon visabl = const Icon(
    Icons.visibility,
    color: AppColors.primaryColor,
  );
  bool obscure = true;

  changeVisability() {
    if (obscure) {
      obscure = !obscure;
      visabl = const Icon(
        Icons.visibility_off,
        color: AppColors.primaryColor,
      );
    } else {
      obscure = !obscure;
      visabl = const Icon(
        Icons.visibility,
        color: AppColors.primaryColor,
      );
    }
    emit(ChangeVisability());
  }

  // Future goDirectlyToNextScreen() async {
  //   var storage = await SharedPreferences.getInstance();
  //   bool go = storage.getBool("keepMeLoggedIn") ?? false;
  //   if (go) {
  //     emit(LoginCubitSuccess());
  //   } else {
  //     emit(LoginCubitInitial());
  //   }
  // }
}
