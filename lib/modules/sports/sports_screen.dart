import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/news_cubit.dart';
import '../../shared/cubit/news_cubit_states.dart';

class SportsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    List sportsNews=NewsCubit.getInstance(context).sportsNews;
    return BlocConsumer<NewsCubit,NewsCubitStates>(
      listener: (context, state){} ,
      builder: (context, state) {
        return ConditionalBuilder(
          condition: sportsNews.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: articleList(sportsNews),
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}