import 'package:untitled/Features/home/data/models/government_model.dart';

abstract class GetAllGovernmentsStates {}

class GetAllGovernmentsInitialState extends GetAllGovernmentsStates {}

class GetAllGovernmentsLoadingState extends GetAllGovernmentsStates {}

class GetAllGovernmentsSuccessState extends GetAllGovernmentsStates {
  final List<GovernmentModel> governments;

  GetAllGovernmentsSuccessState({required this.governments});
}

class GetAllGovernmentsErrorState extends GetAllGovernmentsStates {
  final String errorMessage;

  GetAllGovernmentsErrorState({required this.errorMessage});
}
