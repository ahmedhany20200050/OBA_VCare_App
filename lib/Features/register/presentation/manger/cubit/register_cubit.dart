// ignore_for_file: missing_required_param
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/helpers/api.dart';
import '../../../../../core/utils/endpoints.dart';
import 'register_cubit_state.dart';


class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(RegisterCubitInitial());
  late String token;
  Future register({required String name,required String email,required String phone, required String password, required String confirmPassword,required bool isMale}) async {
    emit(RegisterCubitLoading());
    try {
      var data = await Api().post(
        url: EndPoints.baseUrl + EndPoints.registerEndpoint,
        body: {
          'name':name,
          'email': email,
          'phone':phone,
          'gender':isMale?'0':'1',
          'password': password,
          'password_confirmation': confirmPassword,
        },
      );
      emit(RegisterCubitSuccess());
      token = data['data']['token'];
      var storage = const FlutterSecureStorage();
      await storage.write(key: "token", value: token);
       print(token);
    } on Exception catch (e) {
      emit(RegisterCubitFailure(errmsg: e.toString()));
    }
  }

  Future goDirectlyToNextScreen()async{
    var storage=await SharedPreferences.getInstance();
    bool go= storage.getBool("keepMeLoggedIn")??false;
    if(go){
      emit(RegisterCubitSuccess());
    }else{
      emit(RegisterCubitInitial());
    }
  }
}
