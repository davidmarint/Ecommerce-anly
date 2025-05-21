
import 'package:flutter_bloc/flutter_bloc.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Rango de edad'); 

  String selectedAge = '';

  void selectAge(String age) {
    selectedAge = age;
    emit(age);
  }
}