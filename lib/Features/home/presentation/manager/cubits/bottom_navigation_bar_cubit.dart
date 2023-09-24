import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/bottom_navigation_bar_states.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarStates> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
  static BottomNavigationBarCubit get(context) => BlocProvider.of(context);
  void update() {
    emit(BottomNavigationBarChangedState());
  }
}
