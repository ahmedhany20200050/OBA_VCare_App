sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class ChangeVisability extends LoginCubitState {}

final class LoginCubitLoading extends LoginCubitState {}

final class LoginCubitSuccess extends LoginCubitState {}

final class LoginCubitFailure extends LoginCubitState {
  Map<String, dynamic> err;

  LoginCubitFailure({required this.err});
}
