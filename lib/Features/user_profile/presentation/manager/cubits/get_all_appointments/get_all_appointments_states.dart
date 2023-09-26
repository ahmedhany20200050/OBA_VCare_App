import 'package:untitled/Features/home/data/models/history_model.dart';

abstract class GetAllAppointmentsStates {}
class GetAllAppointmentsInitialState extends GetAllAppointmentsStates{}
class GetAllAppointmentsLoadingState extends GetAllAppointmentsStates{}
class GetAllAppointmentsSuccessState extends GetAllAppointmentsStates{
  final List<HistoryModel> appointments;
  GetAllAppointmentsSuccessState({required this.appointments});
}
class GetAllAppointmentsFailureState extends GetAllAppointmentsStates{
  final String errorMessage;
  GetAllAppointmentsFailureState({required this.errorMessage});
}