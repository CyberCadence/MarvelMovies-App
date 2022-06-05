part of 'marvel_bloc.dart';

@immutable
abstract class MarvelState {}

class MarvelInitialstate extends MarvelState {}

class MarvelLoadingstate extends MarvelState {}

class MarvelLoadedstate extends MarvelState {
  final McuModel mcuModel;

  MarvelLoadedstate({required this.mcuModel});
 
}

class MarvelErrorstate extends MarvelState {
  

}
