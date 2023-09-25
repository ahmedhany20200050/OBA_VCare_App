import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/doctor%20details(booking)/data/models/doctor_model.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_state.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class DoctorDetailsCubit extends Cubit<DoctorDetailsState> {
  DoctorDetailsCubit() : super(DoctorDetailsInitial());
  String? token;
  DateTime? time;
  DoctorModel? docmodel;
  List<String> availTimes = [];

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
        availableBookTimes();
      },
    );
  }

  bookAppointment({
    required String doctorId,
    required String startTime,
  }) async {
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    emit(BookAppointmentLoading());
    await Api().post(
      url: EndPoints.baseUrl + EndPoints.appointmentStoreEndpoint,
      token: token,
      body: {
        'doctor_id': doctorId,
        'start_time': startTime,
      },
    ).then(
      (value) {
        emit(BookAppointmentSuccess());
      },
    );
  }

  availableBookTimes() {
    int startTimeHour = int.parse(docmodel!.startTime!.substring(0, 2));
    int startTimeMinute = int.parse(docmodel!.startTime!.substring(3, 5));
    int endtimehour = int.parse(docmodel!.endTime!.substring(0, 2));
    int endtimeminute = int.parse(docmodel!.endTime!.substring(3, 5));
    DateTime start = DateTime(1999, 10, 3, startTimeHour, startTimeMinute);
    DateTime end = DateTime(1999, 10, 3, endtimehour, endtimeminute);
    time = start;

    for (; time!.hour <= end.hour;) {
      if (time!.minute==0) {
        availTimes.add('${time!.hour.toString()}:${time!.minute.toString()}0'); 
      } else {
       availTimes.add('${time!.hour.toString()}:${time!.minute.toString()}'); 
      }
      
      time = time!.add(const Duration(minutes: 30));
    }
    if (end.minute == 0) {
      availTimes.removeLast();
    }
  }
}
