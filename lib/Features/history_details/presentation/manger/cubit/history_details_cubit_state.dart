sealed class HistoryDetailsCubitState {}

final class HistoryDetailsCubitInitial extends HistoryDetailsCubitState {}

final class HistoryDetailsCubitLoading extends HistoryDetailsCubitState {}

final class HistoryDetailsCubitSuccess extends HistoryDetailsCubitState {}

final class HistoryDetailsCubitFailure extends HistoryDetailsCubitState {
  String err;

  HistoryDetailsCubitFailure({required this.err});
}
