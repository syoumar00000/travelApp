import 'package:agnonter/cubit/cubit-state.cubit.dart';
import 'package:agnonter/models/data_model.dart';
import 'package:agnonter/services/data-services.dart';
import 'package:agnonter/services/fcils-services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({
    required this.data,
    //required this.fcData
  }) : super(InitialeState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  //final FcilServices fcData;
  late final places;
  //late final fcilPlaces;
  Future<void> getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      //print("places...$places");
      emit(LoadedState(places));
      // fcilPlaces = await fcData.getFcilInfo();
      // emit(LoadedFcState(fcilPlaces));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  // detailFcPage(DataModel fcdata) {
  //   emit(DetailFcState(fcdata));
  // }

  goHome() {
    emit(LoadedState(places));
  }

  // goFcHome() {
  //   emit(LoadedFcState(fcilPlaces));
  // }
}
