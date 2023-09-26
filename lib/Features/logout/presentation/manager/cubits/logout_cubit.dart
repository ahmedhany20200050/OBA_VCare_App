import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/logout/data/repo/logout_repo.dart';
import 'package:untitled/Features/logout/presentation/manager/cubits/logout_states.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutInitialState());

  static LogoutCubit get(context) => BlocProvider.of(context);

  void logout() async{
    try {
      emit(LogoutLoadingState());
      await LogoutRepo.logout();
      emit(LogoutSuccessState());
    } on Exception catch (e) {
      emit(LogoutFailureState(errorMessage: e.toString()));
    } catch (_) {
      emit(LogoutFailureState(errorMessage: "Something went wrong"));
    }
  }
}
