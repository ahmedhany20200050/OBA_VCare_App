// ignore_for_file: missing_required_param
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Features/search/presentation/manger/cubit/search_cubit_state.dart';
// import '../../../../../core/helpers/api.dart';
import '../../../../../core/utils/endpoints.dart';
import '../../../data/all_doctors_response.dart';
import 'package:http/http.dart'as http;


class GetDoctorsCubit extends Cubit<GetDoctorsCubitState> {
  GetDoctorsCubit() : super(GetDoctorsCubitInitial());
  late String token;
  late AllDoctorsResponse doctors;
  Future getAllDoctors() async {
    emit(GetDoctorsCubitLoading());
    print("get doctors loading");
    String token= await const FlutterSecureStorage().read(key: "token")??"";
    try {
      http.Response response;
      response= await http.get(
        Uri.parse(EndPoints.baseUrl+EndPoints.allDoctorsEndpoint),
        headers: {
          'Authorization':"Bearer $token",
        }
      );
      print(response.body);
      doctors= AllDoctorsResponse.fromJson(jsonDecode(response.body));
      if(response.statusCode>=200&&response.statusCode<300){
        emit(GetDoctorsCubitSuccess());
      }else{
        throw Exception(response.reasonPhrase.toString());
      }

    } on Exception catch (e) {
      emit(GetDoctorsCubitFailure(err: e.toString()));
    }
  }



}
