import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/data/repo/cities_of_government_repo.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cities_of_government/cities_of_government_states.dart';

class CitiesOfGovernmentCubit extends Cubit<CitiesOfGovernmentStates> {
  CitiesOfGovernmentCubit() : super(CitiesOfGovernmentInitialState());
  static CitiesOfGovernmentCubit get(context) => BlocProvider.of(context);
  void getAllCities() async {
    try {
      emit(CitiesOfGovernmentLoadingState());
      final cities = await CitiesOfGovernmentRepo.getCitiesOfGovernment();
      emit(CitiesOfGovernmentSuccessState(cities: cities));
    } on Exception catch (e) {
      emit(CitiesOfGovernmentErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(CitiesOfGovernmentErrorState(errorMessage: "Something went wrong"));
    }
  }
}
