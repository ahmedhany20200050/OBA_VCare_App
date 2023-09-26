import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/user_profile/data/repo/get_all_appointments_repo.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/get_all_appointments/get_all_appointments_states.dart';

class GetAllAppointmentCubit extends Cubit<GetAllAppointmentsStates> {
  GetAllAppointmentCubit() : super(GetAllAppointmentsInitialState());

  static GetAllAppointmentCubit get(context) => BlocProvider.of(context);

  void getAllAppointments() async{
    try {
      emit(GetAllAppointmentsLoadingState());
      final appointments = await GetAllAppointmentsRepo.getAllAppointments();
      emit(GetAllAppointmentsSuccessState(appointments: appointments));
    } on Exception catch (e) {
      emit(GetAllAppointmentsFailureState(errorMessage: e.toString()));
    } catch (_) {
      emit(GetAllAppointmentsFailureState(errorMessage: "Something went wrong"));
    }
  }
}
