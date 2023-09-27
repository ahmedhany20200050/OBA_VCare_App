import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/radio_button/radio_button_states.dart';

class RadioButtonCubit extends Cubit<RadioButtonStates> {
  RadioButtonCubit() : super(RadioButtonInitialState());

  static RadioButtonCubit get(context) => BlocProvider.of(context);

  void changeSelectedValue() {
    emit(RadioButtonChangedState());
  }
}
