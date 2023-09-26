import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class GetAllAppointmentsRepo {
  static Future<List<HistoryModel>> getAllAppointments() async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api()
        .get(url: EndPoints.baseUrl + EndPoints.historyEndpoint, token: token);
    List<HistoryModel> appointments = [];
    appointments.addAll(data['data']
        .map((history) => HistoryModel.fromJson(history))
        .toList<HistoryModel>());
    return appointments;
  }
}
