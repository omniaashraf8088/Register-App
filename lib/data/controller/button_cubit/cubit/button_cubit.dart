

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitial()); 

  

String getUserData(String text){

  if(text==text){
      emit(ButtonVisbalText());
    }else{
      emit(ButtonNotVisbalText());
    }
    return text;



}





}
