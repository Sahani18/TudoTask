import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tudotask/Screens/bottom_bar_page.dart';
import 'package:tudotask/Screens/home.dart';

import 'package:tudotask/Services/service_api.dart';

import 'Bloc/breaking_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breaking Bad',
      debugShowCheckedModeBanner: false,


      theme: ThemeData(primaryColor: Colors.blue.shade900),
      home: BlocProvider(
        create: (context) => BreakingBloc(breakingApi: BreakingBadService()),
        child: BottomPage(),

      ),
    );
  }
}
