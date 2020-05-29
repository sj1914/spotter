import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:spotter/repositories/dog_breeds_repository.dart';
import 'package:spotter/repositories/personal_page_repository.dart';
import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  final DogBreedsRepository dogBreedsRepository;
  final PersonalPageRepository personalPageRepository;
  int currentIndex = 0;

  BottomNavigationBloc({this.dogBreedsRepository, this.personalPageRepository})
      : assert(dogBreedsRepository != null),
        assert(personalPageRepository != null);

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.dispatch(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getDogBreedData();
        yield DogBreedPageLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        int data = await _getPersonalPageData();
        yield PersonalPageLoaded(number: data);
      }
    }
  }

  Future<String> _getDogBreedData() async {
    String data = dogBreedsRepository.data;
    if (data == null) {
      await dogBreedsRepository.fetchData();
      data = dogBreedsRepository.data;
    }
    return data;
  }

  Future<int> _getPersonalPageData() async {
    int data = personalPageRepository.data;
    if (data == null) {
      await personalPageRepository.fetchData();
      data = personalPageRepository.data;
    }
    return data;
  }
}
