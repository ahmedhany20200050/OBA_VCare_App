import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/data/repo/get_all_specialization_repo.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_specialization/get_all_specialization_states.dart';

class GetAllSpecializationCubit extends Cubit<GetAllSpecializationStates> {
  GetAllSpecializationCubit() : super(GetAllSpecializationInitialState());

  static GetAllSpecializationCubit get(context) => BlocProvider.of(context);

  void getAllSpecialization() async {
    try {
      emit(GetAllSpecializationLoadingState());
      final specializations = await GetAllSpecializationRepo.getAllSpecializations();
      emit(GetAllSpecializationSuccessState(specializations: specializations));
    } on Exception catch (e) {
      emit(GetAllSpecializationErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(GetAllSpecializationErrorState(errorMessage: "Something went wrong"));
    }
  }
}
