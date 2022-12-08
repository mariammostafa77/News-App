import 'package:flutter/cupertino.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';

import '../../network/remote/dio_helper.dart';
import 'news_cubit_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsCubitStates>{
  //NewsCubit(super.initialState);

  NewsCubit():super(NewsInitState());

  int currentSelectedIndex=0;

  List<Widget> screens=[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  List<String> screenTitles = [
    'BusinessNews',
    'ScienceNews',
    'SportsNews'
  ];

  static NewsCubit getInstance(context) => BlocProvider.of(context);



  void changeBottomNavState(int index){
    currentSelectedIndex=index;
    if(index==1){
      getScienceNews();
    }else{
      if(index==2){
        getSportsNews();
      }
    }
    emit(NewsChangeBottomNavState());
    
  }
  List<dynamic> businessNews=  [];
  void getBusinessNews(){
    emit(NewsGetBusinessNewsLoadingState());
    DioHelper.getNews(url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'business',
      'apikey':'31208a710c954350a680d4fd0cd284fa',
    }).then((value) {
      businessNews.clear();
      businessNews.addAll(value.data['articles']);
      emit(NewsGetBusinessNewsSuccessState());
    })
        .catchError((error){
      emit(NewsGetBusinessNewsErrorState(error.toString()));
    });
    
  }
  List<dynamic> scienceNews=  [];
  void getScienceNews(){
    emit(NewsGetScienceNewsLoadingState());
    DioHelper.getNews(url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'science',
      'apikey':'31208a710c954350a680d4fd0cd284fa',
    }).then((value) {
      scienceNews.clear();
      scienceNews.addAll(value.data['articles']);
      emit(NewsGetScienceNewsSuccessState());
    })
        .catchError((error){
          emit(NewsGetScienceNewsErrorState(error.toString()));
        });
  }
  List<dynamic> sportsNews=  [];
  void getSportsNews(){
    emit(NewsGetSportsNewsLoadingState());
    DioHelper.getNews(url: 'v2/top-headlines', queries: {
      'country': 'eg',
      'category': 'sport',
      'apikey':'31208a710c954350a680d4fd0cd284fa',
    }).then((value) {
      sportsNews.clear();
      sportsNews.addAll(value.data['articles']);
      emit(NewsGetSportsNewsSuccessState());
    })
        .catchError((error){
      emit(NewsGetSportsNewsErrorState(error.toString()));
    });
  }


  bool isDark = false;
  void changeThemeMode(){
    isDark = !isDark;
    emit(NewsThemModeState());
  }


}