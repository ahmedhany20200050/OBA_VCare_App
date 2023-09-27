import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class GetAllSpecializationRepo {
  static Future<List<Specialization>> getAllSpecializations() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api().get(
        url: EndPoints.baseUrl + EndPoints.getAllSpecializationsEndPoint,
        token: token);
    return data['data']
        .map((specialization) => Specialization.fromJson(specialization))
        .toList()
        .cast<Specialization>();
  }
}
