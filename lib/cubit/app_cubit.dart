import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mountain_trips/models/data_model.dart';

import 'package:mountain_trips/services/data_services.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit(
    this.data,
  ) : super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState( places: places));
    }
    catch(e){}
  }
}
