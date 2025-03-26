 import 'package:ecommerce_anly/domain/auth/useCase/get_user.dart';
import 'package:ecommerce_anly/presentation/home/bloc/user_info_display_state.dart';
import 'package:ecommerce_anly/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {

UserInfoDisplayCubit(): super(UserInfoLoading());

void displayUserInfo() async{
  var returnData = await sl<GetUserUseCase>().call();
  returnData.fold(
    (error){
     emit( LoadUserInfoFailure());
    }, 
    (data){
      emit(UserInfoLoaded(user: data));
    }
  );
}

}