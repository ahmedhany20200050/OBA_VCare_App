sealed class GetDoctorsCubitState {}

final class GetDoctorsCubitInitial extends GetDoctorsCubitState {}

final class GetDoctorsCubitLoading extends GetDoctorsCubitState {}

final class GetDoctorsCubitSuccess extends GetDoctorsCubitState {}

final class GetDoctorsCubitFailure extends GetDoctorsCubitState {
  String err;

  GetDoctorsCubitFailure({required this.err});
}
