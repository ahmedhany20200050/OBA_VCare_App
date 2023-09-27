import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class LogoutRepo {
  static Future<void> logout() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    await Api().post(
        url: EndPoints.baseUrl + EndPoints.logoutEndpoint,
        body: {},
        token: token);
    storage.delete(key: 'token');
  }
}
