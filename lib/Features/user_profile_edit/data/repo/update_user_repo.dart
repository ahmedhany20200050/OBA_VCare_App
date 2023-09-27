import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class UpdateUserRepo {
  static Future<void> updateUser(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm,
      required String gender}) async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    await Api().post(
        url: EndPoints.baseUrl + EndPoints.updateProfileEndpoint,
        body: {
           'name':name,
           'email':email,
           'phone':phone,
           'gender':gender,
           'password':password,
          'password_confirmation':passwordConfirm,
        },
        token: token);
  }
}
