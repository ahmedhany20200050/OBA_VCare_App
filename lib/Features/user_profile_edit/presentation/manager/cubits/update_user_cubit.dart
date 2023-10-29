import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/user_profile_edit/data/repo/update_user_repo.dart';
import 'package:untitled/Features/user_profile_edit/presentation/manager/cubits/update_user_states.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserInitialState());

  static UpdateUserCubit get(context) => BlocProvider.of(context);
  void updateUser(
      {required String name,
      required String email,
      required String phone,
      required String password,
      required String passwordConfirm,
      required String gender}) async{
    try {
      emit(UpdateUserLoadingState());
      await UpdateUserRepo.updateUser(
          email: email,
          name: name,
          phone: phone,
          password: password,
          passwordConfirm: passwordConfirm,
          gender: gender);
      emit(UpdateUserSuccessState());
    } on Exception catch (e) {
      emit(UpdateUserErrorState(errorMessage: e.toString()));
    } catch (_) {
      emit(UpdateUserErrorState(errorMessage: "Something went wrong"));
    }
  }
}
