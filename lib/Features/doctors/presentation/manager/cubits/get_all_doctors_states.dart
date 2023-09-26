import 'package:untitled/Features/home/data/models/major_model.dart';

abstract class GetAllDoctorsStates {}
class GetAllDoctorsInitialState extends GetAllDoctorsStates{}
class GetAllDoctorsLoadingState extends GetAllDoctorsStates{}
class GetAllDoctorsSuccessState extends GetAllDoctorsStates{
  final List<Doctors> doctors;
  GetAllDoctorsSuccessState({required this.doctors});
}
class GetAllDoctorsFailureState extends GetAllDoctorsStates{
  final String errorMessage;
  GetAllDoctorsFailureState({required this.errorMessage});
}