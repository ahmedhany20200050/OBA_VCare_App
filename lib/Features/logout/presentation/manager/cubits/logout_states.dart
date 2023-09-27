abstract class LogoutStates {}
class LogoutInitialState extends LogoutStates{}
class LogoutLoadingState extends LogoutStates{}
class LogoutSuccessState extends LogoutStates{}
class LogoutFailureState extends LogoutStates{
  final String errorMessage;
  LogoutFailureState({required this.errorMessage});
}