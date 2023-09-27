import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_cities/get_all_cities_states.dart';

class GetAllCitiesCubit extends Cubit<GetAllCitiesStates> {
  GetAllCitiesCubit() : super(GetAllCitiesInitalState());
  void getAllCities() {
    try {
      emit(GetAllCitiesLoadingState());
      final cities = [];
      emit(GetAllCitiesSuccessState(cities: cities));
    } on Exception catch (e) {
      emit(GetAllCitiesErrorState(message: e.toString()));
    } catch (_) {
      emit(GetAllCitiesErrorState(message: "Something went wrong"));
    }
  }
}
