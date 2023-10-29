import 'package:untitled/Features/home/data/models/major_model.dart';

abstract class FilterDoctorStates {}
class FilterDoctorInitialState extends FilterDoctorStates {}
class FilterDoctorLoadingState extends FilterDoctorStates {}
class FilterDoctorSuccessState extends FilterDoctorStates {
  final List<Doctors> doctors;
  FilterDoctorSuccessState({required this.doctors});
}
class FilterDoctorErrorState extends FilterDoctorStates {
  final String errorMessage;
  FilterDoctorErrorState({required this.errorMessage});
}