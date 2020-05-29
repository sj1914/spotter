import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class BottomNavigationState extends Equatable {
  BottomNavigationState([List props = const []]) : super(props);
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({@required this.currentIndex}) : super([currentIndex]);

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class DogBreedPageLoaded extends BottomNavigationState {
  final String text;

  DogBreedPageLoaded({@required this.text}) : super([text]);

  @override
  String toString() => 'FirstPageLoaded with text: $text';
}

class PersonalPageLoaded extends BottomNavigationState {
  final int number;

  PersonalPageLoaded({@required this.number}) : super([number]);

  @override
  String toString() => 'SecondPageLoaded with number: $number';
}