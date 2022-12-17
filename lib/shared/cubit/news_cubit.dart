import 'package:flutter/cupertino.dart';
import 'package:news/modules/business/business_screen.dart';
import 'package:news/modules/science/science_screen.dart';
import 'package:news/modules/sports/sports_screen.dart';

import '../../network/local/cache_helper.dart';
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
    if(businessNews.isEmpty){
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
        print(error);
      });
    }
  }
  List<dynamic> scienceNews=  [];
  void getScienceNews(){
    if(scienceNews.isEmpty){
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
        print(error);
      });
    }
  }
  List<dynamic> sportsNews=  [];
  void getSportsNews(){
    if(sportsNews.isEmpty){
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
        print(error);

      });
    }
  }


  bool isDark = false;
  void changeThemeMode(){
    isDark = !isDark;
    CacheHelper.setBoolData(key: 'isDark', value: isDark).then((value) => emit(NewsThemModeState()));
  }





  List<dynamic> searchNewsResults=  [];
  void getSearchNewsResults(String word){
    emit(NewsSearchLoadingState());
    //https://newsapi.org/v2/everything?q=Apple&from=2022-12-08&sortBy=popularity&apiKey=API_KEY
    DioHelper.getNews(url: 'v2/everything', queries: {
      'q': word,
      'apikey':'31208a710c954350a680d4fd0cd284fa',
    }).then((value) {
      searchNewsResults.clear();
      searchNewsResults.addAll(value.data['articles']);
      emit(NewsSearchSuccessState());
    })
        .catchError((error){
      emit(NewsSearchErrorState(error.toString()));
    });

  }
  static String searchText='';










}