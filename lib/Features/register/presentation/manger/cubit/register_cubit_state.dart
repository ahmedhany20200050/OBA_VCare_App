sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLoading extends RegisterCubitState {}

final class RegisterCubitSuccess extends RegisterCubitState {}

final class RegisterCubitFailure extends RegisterCubitState {
  Map<String,dynamic> errmsg;

  RegisterCubitFailure({required this.errmsg});
}
