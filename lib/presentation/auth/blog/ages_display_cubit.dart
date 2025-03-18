import 'package:ecommerce_anly/domain/auth/useCase/get_ages.dart';
import 'package:ecommerce_anly/presentation/auth/blog/ages_display_states.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayStates> {
  AgesDisplayCubit() : super(AgesLoading());

  void displayAges() async {
    var returnedData = await sl<GetAgesUseCase>().call(); 

    returnedData.fold(
      (message) => emit(
        AgesLoadFaiture(message: message)
      ),
      (data) => emit(
        AgesLoaded(ages: data)
      )
    );
  }

}