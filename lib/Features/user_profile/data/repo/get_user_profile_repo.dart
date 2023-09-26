import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/user_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class GetUserProfileRepo {
  static Future<UserModel> getUserProfile() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api().get(
        url: EndPoints.baseUrl + EndPoints.userProfileEndpoint, token: token);
    return UserModel.fromJson(data['data'][0]);
  }
}
