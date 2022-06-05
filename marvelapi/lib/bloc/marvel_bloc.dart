import 'package:bloc/bloc.dart';
import 'package:marvelapi/Models/MOdelVIew.dart';
import 'package:marvelapi/Networkfile/networkfile.dart';
import 'package:meta/meta.dart';

part 'marvel_event.dart';
part 'marvel_state.dart';

class MarvelBloc extends Bloc<MarvelEvent, MarvelState> {
  final Repository repository;
  MarvelBloc({required this.repository}) : super(MarvelInitialstate()) {
    on<MarvelEvent>((event, emit) async {
      if (event is Marvelloadevent) {
        emit(MarvelLoadingstate());
        final McuModel? mcuModel = await repository.getApi();

        if (mcuModel == null) {
          emit(MarvelErrorstate());
        } else {
          emit(MarvelLoadedstate(mcuModel: mcuModel));
        }
      }
    });
  }
}
