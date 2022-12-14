import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit_states.dart';

import '../../shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List businessNews = NewsCubit.getInstance(context).businessNews;
    return BlocConsumer<NewsCubit, NewsCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: businessNews.isNotEmpty,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: articleList(businessNews),
          ),
          fallback: (context) =>
              const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
