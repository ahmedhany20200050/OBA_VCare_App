import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/user_profile/data/repo/get_user_profile_repo.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/user_profile/user_profile_states.dart';

class UserProfileCubit extends Cubit<UserProfileStates> {
  UserProfileCubit() : super(UserProfileInitialState());

  static UserProfileCubit get(context) => BlocProvider.of(context);
  void getUserProfile() async{
    try {
      emit(UserProfileLoadingState());
      final user = await GetUserProfileRepo.getUserProfile();
      emit(UserProfileSuccessState(userModel: user));
    } on Exception catch (e) {
      emit(UserProfileFailureState(errorMessage: e.toString()));
    } catch (_) {
      emit(UserProfileFailureState(errorMessage: "Something went wrong"));
    }
  }
}
