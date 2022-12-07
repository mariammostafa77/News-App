import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cubit/news_cubit.dart';
import 'package:news/shared/cubit/news_cubit_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusinessNews(),
      child: BlocConsumer<NewsCubit, NewsCubitStates>(
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.getInstance(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.brightness_4_outlined),
                  color: Colors.black,
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
                    width: 10.0,
                  ),
                  Text(
                      NewsCubit.getInstance(context).screenTitles[
                          NewsCubit.getInstance(context).currentSelectedIndex],
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 22.0,
                      )),
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
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              showUnselectedLabels: true,
              elevation: 10.0,
            ),
          );
        },
        listener: (context, state) => (context, state) {},
      ),
    );
  }
}
