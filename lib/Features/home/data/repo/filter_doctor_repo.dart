import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class FilterDoctorsRepo{
  static Future<List<Doctors>> filterDoctors(
      {required int cityId,
      required int governorateId,
      required int specalizationId}) async {
    var storage = const FlutterSecureStorage();
    var token = await storage.read(key: 'token');
    final data = await Api().get(
        url: EndPoints.baseUrl +
            EndPoints.filterDoctorsEndpoint(
                cityId: cityId,
                governorateId: governorateId,
                specializationId: specalizationId),
        token: token);
    return data['data']
        .map((doctor) => Doctors.fromJson(doctor))
        .toList()
        .cast<Doctors>();
  }
}
