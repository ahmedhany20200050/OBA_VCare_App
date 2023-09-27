import 'package:untitled/Features/home/data/models/history_model.dart';

abstract class CitiesOfGovernmentStates {}
class CitiesOfGovernmentInitialState extends CitiesOfGovernmentStates {}
class CitiesOfGovernmentLoadingState extends CitiesOfGovernmentStates {}
class CitiesOfGovernmentSuccessState extends CitiesOfGovernmentStates {
  final List<City> cities;
  CitiesOfGovernmentSuccessState({required this.cities});
}
class CitiesOfGovernmentErrorState extends CitiesOfGovernmentStates {
  final String errorMessage;
  CitiesOfGovernmentErrorState({required this.errorMessage});
}

