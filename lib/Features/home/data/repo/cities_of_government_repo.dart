import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class CitiesOfGovernmentRepo {
  static Future<List<City>> getCitiesOfGovernment() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api().get(
        url: EndPoints.baseUrl +
            EndPoints.getAllCitiesEndPoint,
        token: token);
    return data['data'].map((city) => City.fromJson(city))
        .toList()
        .cast<City>();
  }
}
