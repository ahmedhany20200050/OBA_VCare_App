import 'package:untitled/Features/home/data/models/history_model.dart';

abstract class GetAllSpecializationStates {}
class GetAllSpecializationInitialState extends GetAllSpecializationStates {}
class GetAllSpecializationLoadingState extends GetAllSpecializationStates {}
class GetAllSpecializationSuccessState extends GetAllSpecializationStates {
  final List<Specialization> specializations;
  GetAllSpecializationSuccessState({required this.specializations});
}
class GetAllSpecializationErrorState extends GetAllSpecializationStates {
  final String errorMessage;
  GetAllSpecializationErrorState({required this.errorMessage});
}
