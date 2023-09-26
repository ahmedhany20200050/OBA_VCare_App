import 'package:untitled/Features/user_profile/data/models/user_model.dart';

abstract class UserProfileStates {}

class UserProfileInitialState extends UserProfileStates {}

class UserProfileLoadingState extends UserProfileStates {}

class UserProfileSuccessState extends UserProfileStates {
  final UserModel userModel;
  UserProfileSuccessState({required this.userModel});
}

class UserProfileFailureState extends UserProfileStates {
  final String errorMessage;
  UserProfileFailureState({required this.errorMessage});
}
