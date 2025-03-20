import 'package:dartz/dartz.dart';
import 'package:ecommerce_anly/bloc/button/button_state.dart';
import 'package:ecommerce_anly/core/useCase/useCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateGenericCubit extends Cubit<ButtonState> {
  ButtonStateGenericCubit() : super(ButtonInitalState());


  Future<void> execute({dynamic params,required Usecase usecase }) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);
      returnedData.fold(
        (error) {
          emit(
            ButtonFailureState(
            errorMessage: error
          )
         );
        },
        (data) {
          emit(ButtonSuccessState());
        }
      );

    } catch (e) {
      emit(
        ButtonFailureState(
          errorMessage: e.toString()
        )
      );
    }
  }
}
