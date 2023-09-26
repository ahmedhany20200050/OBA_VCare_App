sealed class DoctorDetailsState {}

final class DoctorDetailsInitial extends DoctorDetailsState {}

final class ShowDoctorDetailsSuccess extends DoctorDetailsState {}

final class ShowDoctorDetailsLoading extends DoctorDetailsState {}

final class ShowDoctorDetailsFailure extends DoctorDetailsState {}

final class BookAppointmentSuccess extends DoctorDetailsState {}

final class BookAppointmentLoading extends DoctorDetailsState {}

final class BookAppointmentFailure extends DoctorDetailsState {}
