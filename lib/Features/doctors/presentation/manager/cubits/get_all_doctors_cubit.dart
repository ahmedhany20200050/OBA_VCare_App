import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/doctors/presentation/manager/cubits/get_all_doctors_states.dart';

class GetAllDoctorsCubit extends Cubit<GetAllDoctorsStates> {
  GetAllDoctorsCubit() : super(GetAllDoctorsInitialState());

  static GetAllDoctorsCubit get(context) => BlocProvider.of(context);

  // void getAllDoctors() {
  //   emit(GetAllDoctorsLoadingState());
  //   DioHelper.getData(url: "doctors").then((value) {
  //     final List<Doctors> doctors = [];
  //     value.data.forEach((element) {
  //       doctors.add(Doctors.fromJson(element));
  //     });
  //     emit(GetAllDoctorsSuccessState(doctors: doctors));
  //   }).catchError((error) {
  //     emit(GetAllDoctorsFailureState(errorMessage: error.toString()));
  //   });
  // }
}
