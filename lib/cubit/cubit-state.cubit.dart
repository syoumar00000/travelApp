import 'package:agnonter/models/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable {}

class InitialeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class WelcomeState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadingState extends CubitStates {
  @override
  List<Object> get props => [];
}

class LoadedState extends CubitStates {
  LoadedState(this.places);
  final List<DataModel> places;
  @override
  List<Object> get props => [places];
}

// class LoadedFcState extends CubitStates {
//   LoadedFcState(this.places);
//   final List<DataModel> places;
//   @override
//   List<Object> get props => [places];
// }

class DetailState extends CubitStates {
  DetailState(this.place);
  final DataModel place;
  @override
  List<Object> get props => [place];
}

// class DetailFcState extends CubitStates {
//   DetailFcState(this.place);
//   final DataModel place;
//   @override
//   List<Object> get props => [place];
// }
