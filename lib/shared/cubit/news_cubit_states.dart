abstract class NewsCubitStates{
}
class NewsInitState extends NewsCubitStates{}
class NewsChangeBottomNavState extends NewsCubitStates{}

class NewsGetBusinessNewsSuccessState extends NewsCubitStates{}
class NewsGetBusinessNewsLoadingState extends NewsCubitStates{}
class NewsGetBusinessNewsErrorState extends NewsCubitStates{
  final String error;
  NewsGetBusinessNewsErrorState(this.error);
}

class NewsGetScienceNewsSuccessState extends NewsCubitStates{}
class NewsGetScienceNewsLoadingState extends NewsCubitStates{}
class NewsGetScienceNewsErrorState extends NewsCubitStates{
  final String error;
  NewsGetScienceNewsErrorState(this.error);
}

class NewsGetSportsNewsSuccessState extends NewsCubitStates{}
class NewsGetSportsNewsLoadingState extends NewsCubitStates{}
class NewsGetSportsNewsErrorState extends NewsCubitStates{
  final String error;
  NewsGetSportsNewsErrorState(this.error);
}

class NewsThemModeState extends NewsCubitStates{}
