import 'package:adhitya/core/resources/data_state.dart';
import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_character_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'remote_character_detail_event.dart';
part 'remote_character_detail_state.dart';

class RemoteCharacterDetailBloc
    extends Bloc<RemoteCharacterDetailEvent, RemoteCharacterDetailState> {
  final GetCharacterDetailUseCase getCharacterDetailUseCase;
  RemoteCharacterDetailBloc(this.getCharacterDetailUseCase)
      : super(RemoteCharacterDetailInitial()) {
    on<GetRemoteCharacterDetail>(onGetRemoteCharacterDetail);
  }

  void onGetRemoteCharacterDetail(GetRemoteCharacterDetail event,
      Emitter<RemoteCharacterDetailState> emit) async {
    emit(RemoteCharacterDetailLoading());
    final result = await getCharacterDetailUseCase(params: event.id);

    if (result is DataSuccess) {
      emit(RemoteCharacterDetailLoaded(result.data!));
    } else if (result is DataFailed) {
      emit(RemoteCharacterDetailFailed(result.error!));
    }
  }
}
