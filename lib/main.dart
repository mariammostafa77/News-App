import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news/layouts/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/shared/components/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme:   const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 2.0,
          backwardsCompatibility: true,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}


//31208a710c954350a680d4fd0cd284fa