import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit_states.dart';

class SearchScreen extends StatelessWidget {
  var searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    searchTextController.text=NewsCubit.searchText;
    searchTextController.selection = TextSelection.fromPosition(TextPosition(offset: searchTextController.text.length));
    List searchResultList = NewsCubit.getInstance(context).searchNewsResults;
    return BlocConsumer<NewsCubit, NewsCubitStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    controller: searchTextController,
                    style: Theme.of(context).textTheme.headline2,
                    decoration: InputDecoration(
                      enabledBorder: const UnderlineInputBorder(),
                      hintText: 'Search',
                      hintStyle: Theme.of(context).textTheme.headline2,
                      prefixIcon: const Icon(Icons.search),
                    ),
                    autofocus: true,
                    onTap: () {},
                    onChanged: (value) {
                      NewsCubit.searchText=searchTextController.text;
                      NewsCubit.getInstance(context).getSearchNewsResults(value);
                    },
                    validator: (value) {
                      if(value!.isEmpty || value==' '){
                        return 'Search must not be empty.';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              ConditionalBuilder(
                condition: state is! NewsSearchLoadingState,
                builder: (context) => Expanded(child: articleList(searchResultList)),
                fallback: (context) => const Expanded(child: Center(child: CircularProgressIndicator())),
              ),

            ],
          ),
        );
      },
    );
  }
}
