part of 'app_cubit.dart';

abstract class AppState extends Equatable {
  const AppState();

}

class InitialState extends AppState {
  
  @override
  List<Object> get props => [];
}


class WelcomeState extends AppState {
  
  @override
  List<Object> get props => [];
}

class LoadingState extends AppState {
  
  @override
  List<Object> get props => [];
}
class LoadedState extends AppState {
  LoadedState({required this.places});
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

