import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotter/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:spotter/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:spotter/ui/pages/home_page.dart';
import 'package:spotter/repositories/dog_breeds_repository.dart';
import 'package:spotter/repositories/personal_page_repository.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(Spotter());
}

class Spotter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: BlocProvider<BottomNavigationBloc>(
          builder: (context) => BottomNavigationBloc(
            dogBreedsRepository: DogBreedsRepository(),
            personalPageRepository: PersonalPageRepository(),
          )
            ..dispatch(AppStarted()),
          child: HomePage(),
        )
    );
  }
}