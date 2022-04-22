import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_trips/cubit/app_cubit.dart';
import 'package:mountain_trips/cubit/app_logics.dart';
import 'package:mountain_trips/pages/detail_page.dart';
import 'package:mountain_trips/pages/home_page.dart';
import 'package:mountain_trips/pages/navPages/main_page.dart';
import 'package:mountain_trips/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: MainPage(),
     home: BlocProvider<AppCubit>(
       create: (context) => AppCubit(),
       child: AppLogics(),
       )
    );
  }
}