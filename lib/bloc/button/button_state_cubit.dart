
import 'package:ecommerce_anly/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState>{
  ButtonStateCubit() : super(ButtonInitalState());

   Future<void> execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());
    try{
    Either returnedData = await usecase.call(params: params);
    
    returnedData.fold(
      (message) => emit(
        ButtonFailureState(errorMessage: message)
      ),
      (data) => emit(
        ButtonSuccessState()
      )
    );
    }catch(e){
      emit(ButtonFailureState(errorMessage: e.toString()));
    }

   }

}