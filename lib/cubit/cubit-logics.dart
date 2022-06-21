import 'package:agnonter/cubit/cubit-state.cubit.dart';
import 'package:agnonter/cubit/cubit.dart';
import 'package:agnonter/screen/navigation-screen/details-navigation.screen.dart';
import 'package:agnonter/screen/navigation-screen/fcil-detail-navigation-screen.dart';
import 'package:agnonter/screen/navigation-screen/home-navigation.screen.dart';
import 'package:agnonter/screen/welcome.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is DetailState) {
          return DetailNavigationScreen();
        }
        // if (state is DetailFcState) {
        //   return FcDetailNavigationScreen();
        // }
        if (state is WelcomeState) {
          return WelcomeScreen();
        }
        if (state is LoadedState) {
          return HomeNavigationScreen();
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
