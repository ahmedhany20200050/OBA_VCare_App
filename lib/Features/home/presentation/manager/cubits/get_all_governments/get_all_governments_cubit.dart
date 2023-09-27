import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/data/repo/get_all_governments_repo.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/get_all_governments/get_all_governments_states.dart';

class GetAllGovernmentsCubit extends Cubit<GetAllGovernmentsStates> {
  GetAllGovernmentsCubit() : super(GetAllGovernmentsInitialState());

  static GetAllGovernmentsCubit get(context) => BlocProvider.of(context);

  void getAllGovernments() async {
    try {
      emit(GetAllGovernmentsLoadingState());
      final governments = await GetAllGovernmentsRepo.getAllGovernments();
      emit(GetAllGovernmentsSuccessState(governments: governments));
    } on Exception catch (e) {
      emit(GetAllGovernmentsErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(GetAllGovernmentsErrorState(errorMessage: "Something went wrong"));
    }
  }
}
