import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/search/search_screen.dart';
import 'package:news/network/local/cache_helper.dart';
import 'package:news/shared/components/components.dart';
import 'package:news/shared/cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsCubitStates>(
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.getInstance(context);
        //cubit.getBusinessNews();
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                  cubit.searchNewsResults=[];
                  NewsCubit.searchText='';
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  NewsCubit.getInstance(context).changeThemeMode();
                },
                icon: const Icon(Icons.brightness_4_outlined),
              )
            ],
            title: Row(
              children: [
                const Image(
                  image: AssetImage('assets/images/news.png'),
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                    NewsCubit.getInstance(context).screenTitles[
                        NewsCubit.getInstance(context).currentSelectedIndex],
                  style: Theme.of(context).textTheme.headline1,
                   ),
              ],
            ),
          ),
          body: cubit.screens[cubit.currentSelectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentSelectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              cubit.changeBottomNavState(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.science),
                label: 'Science',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports),
                label: 'Sports',
              ),
            ],
            showUnselectedLabels: true,
          ),
        );
      },
      listener: (context, state) => (context, state) {},
    );
  }
}
