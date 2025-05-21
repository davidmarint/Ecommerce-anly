import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/domain/auth/useCase/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateSigninCubit extends Cubit<ButtonState>{
  ButtonStateSigninCubit() : super(ButtonInitalState());

   Future<void> execute({dynamic params,}) async {
    emit(ButtonLoadingState());
    try{
    Either returnedData = await SigninUseCase().call(params: params);
    
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