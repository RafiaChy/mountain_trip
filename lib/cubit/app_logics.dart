import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mountain_trips/cubit/app_cubit.dart';
import 'package:mountain_trips/pages/detail_page.dart';
import 'package:mountain_trips/pages/home_page.dart';
import 'package:mountain_trips/pages/welcome_page.dart';

class AppLogics extends StatefulWidget {
  const AppLogics({ Key? key }) : super(key: key);

  @override
  _AppLogicsState createState() => _AppLogicsState();
}

class _AppLogicsState extends State<AppLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) 
        {
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is LoadedState){
            return HomePage();
          }
          if(state is DetailState){
            return DetailPage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
           
          return Container();
        }),
    );
  }
}