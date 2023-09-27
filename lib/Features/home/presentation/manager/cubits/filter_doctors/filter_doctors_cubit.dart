import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/data/repo/filter_doctor_repo.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/filter_doctors/filter_doctors_states.dart';

class FilterDoctorCubit extends Cubit<FilterDoctorStates> {
  FilterDoctorCubit() : super(FilterDoctorInitialState());

  static FilterDoctorCubit get(context) => BlocProvider.of(context);

  void filterDoctor(
      {required int cityId,
      required int specializationId,
      required int governmentId}) async {
    try {
      emit(FilterDoctorLoadingState());
      final doctors = await FilterDoctorsRepo.filterDoctors(
          cityId: cityId,
          specalizationId: specializationId,
          governorateId: governmentId);
      emit(FilterDoctorSuccessState(doctors: doctors));
    } on Exception catch (e) {
      emit(FilterDoctorErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(FilterDoctorErrorState(errorMessage: "Something went wrong"));
    }
  }
}
