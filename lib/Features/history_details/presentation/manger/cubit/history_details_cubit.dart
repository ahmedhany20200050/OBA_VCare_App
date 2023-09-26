// ignore_for_file: missing_required_param
import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../../core/helpers/api.dart';
import '../../../../../core/utils/endpoints.dart';
import 'history_details_cubit_state.dart';
import 'package:http/http.dart'as http;


class HistoryDetailsCubit extends Cubit<HistoryDetailsCubitState> {
  HistoryDetailsCubit() : super(HistoryDetailsCubitInitial());

  Future getHistoryDetails(int id) async {
    emit(HistoryDetailsCubitLoading());
    try {
      http.Response response;
      response= await http.post(
        Uri.parse(EndPoints.baseUrl+EndPoints.loginEndpoint),
        body: {
        },
      );

      if(response.statusCode>=200&&response.statusCode<300){
        emit(HistoryDetailsCubitSuccess());

      }else if(response.statusCode==422){

      }else{
        throw Exception(response.reasonPhrase.toString());
      }

    } on Exception catch (e) {
      emit(HistoryDetailsCubitFailure(err:e.toString()));
    }
  }

}
