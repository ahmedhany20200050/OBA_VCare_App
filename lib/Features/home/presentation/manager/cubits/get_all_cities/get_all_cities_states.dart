abstract class GetAllCitiesStates {}
class GetAllCitiesInitalState extends GetAllCitiesStates {}
class GetAllCitiesLoadingState extends GetAllCitiesStates {}
class GetAllCitiesSuccessState extends GetAllCitiesStates {
  final List<CityModel> cities;
  GetAllCitiesSuccessState({required this.cities});
}
class GetAllCitiesErrorState extends GetAllCitiesStates {
  final String message;
  GetAllCitiesErrorState({required this.message});
}

