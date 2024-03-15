// ignore_for_file: prefer_const_constructors

import 'package:api_sample4/controller/homescreen_controller.dart';
import 'package:api_sample4/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeScreencontroller(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
