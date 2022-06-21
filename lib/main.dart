import 'package:agnonter/cubit/cubit-logics.dart';
import 'package:agnonter/cubit/cubit.dart';
import 'package:agnonter/screen/navigation-screen/details-navigation.screen.dart';
import 'package:agnonter/screen/navigation-screen/main-navigation.screen.dart';
import 'package:agnonter/screen/welcome.screen.dart';
import 'package:agnonter/services/data-services.dart';
import 'package:agnonter/services/fcils-services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agnonter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(data: DataServices()),
        child: AppCubitLogics(),
      ),
    );
  }
}
