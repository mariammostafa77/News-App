import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layouts/HomeScreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/network/remote/dio_helper.dart';
import 'package:news/shared/components/bloc_observer.dart';
import 'package:news/shared/cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit_states.dart';

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
    print('builddddddddddd');
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsCubitStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.white,
                elevation: 20.0,
                selectedItemColor: Colors.lightBlue[400],
                showSelectedLabels: true,
                unselectedItemColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 20.0,
                backwardsCompatibility: true,
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              cardColor: Colors.white,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                headline2: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
                headline1: TextStyle(
                  color: Colors.lightBlue[400],
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.black54),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: HexColor('333739'),
                elevation: 20.0,
                selectedItemColor: Colors.lightBlue[400],
                showSelectedLabels: true,
                unselectedItemColor: Colors.grey[300],
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                backgroundColor: HexColor('333739'),
                elevation: 20.0,
                backwardsCompatibility: true,
                iconTheme: IconThemeData(
                  color: Colors.grey[300],
                ),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.black54,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              cardColor: HexColor('333739'),
              textTheme: TextTheme(
                bodyText1: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                headline2: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.normal,
                ),
                headline1: TextStyle(
                  color: Colors.lightBlue[200],
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            ),
            themeMode: NewsCubit.getInstance(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

//31208a710c954350a680d4fd0cd284fa
