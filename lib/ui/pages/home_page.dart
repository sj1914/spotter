import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotter/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spotter/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:spotter/blocs/bottom_navigation/bottom_navigation_state.dart';
import 'package:spotter/ui/pages/dog_breeds_page.dart';
import 'package:spotter/ui/pages/personal_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc =
        BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      body: BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
        bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DogBreedPageLoaded) {
            return DogBreedsPage(text: state.text);
          }
          if (state is PersonalPageLoaded) {
            return PersonalPage(number: state.number);
          }
          return Container();
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
              bloc: bottomNavigationBloc,
              builder: (BuildContext context, BottomNavigationState state) {
                return BottomNavigationBar(
                  currentIndex: bottomNavigationBloc.currentIndex,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home, color: Colors.black),
                      title: Text('Doggos'),
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.all_inclusive, color: Colors.black),
                      title: Text('Other Stuff'),
                    ),
                  ],
                  onTap: (index) =>
                      bottomNavigationBloc.dispatch(PageTapped(index: index)),
                );
              }),
    );
  }
}
