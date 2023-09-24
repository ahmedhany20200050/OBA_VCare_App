import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/doctor%20details(booking)/data/models/doctor_model.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_state.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit() : super(DoctorDetailsInitial());
  String? token;
  DoctorModel? docmodel;

  showDoctorDetails({required String docId}) async {
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    emit(ShowDoctorDetailsLoading());
    await Api()
        .get(
            url: EndPoints.baseUrl + EndPoints.doctorShowEndpoint + docId,
            token: token)
        .then(
      (value) {
        docmodel = DoctorModel.fromJson(value['data']);
        emit(ShowDoctorDetailsSuccess());
      },
    );
  }

  bookAppointment({required String doctorId,required String startTime,}) async{
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    emit(BookAppointmentLoading());
    await Api()
        .post(
            url: EndPoints.baseUrl + EndPoints.appointmentStoreEndpoint,
            token: token,
            body: {
              'doctor_id':doctorId,
              'start_time':startTime,
            },)
        .then(
      (value) {
        emit(BookAppointmentSuccess());
      },
    );
  }
}
