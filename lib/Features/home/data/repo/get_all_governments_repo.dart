import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/government_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class GetAllGovernmentsRepo {
  static Future<List<GovernmentModel>> getAllGovernments() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api().get(
        url: EndPoints.baseUrl + EndPoints.getAllGovernmentsEndPoint,
        token: token);
    return data['data']
        .map((government) => GovernmentModel.fromJson(government))
        .toList()
        .cast<GovernmentModel>();
  }
}
