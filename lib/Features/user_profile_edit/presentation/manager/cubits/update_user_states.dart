abstract class UpdateUserStates {}
class UpdateUserInitialState extends UpdateUserStates {}
class UpdateUserLoadingState extends UpdateUserStates {}
class UpdateUserSuccessState extends UpdateUserStates {}
class UpdateUserErrorState extends UpdateUserStates {
  final String errorMessage;
  UpdateUserErrorState({required this.errorMessage});
}