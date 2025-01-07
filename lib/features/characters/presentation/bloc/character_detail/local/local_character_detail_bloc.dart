import 'package:adhitya/features/characters/domain/entities/character.dart';
import 'package:adhitya/features/characters/domain/usecases/get_favorite_character_detail.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'local_character_detail_event.dart';
part 'local_character_detail_state.dart';

class LocalCharacterDetailBloc
    extends Bloc<LocalCharacterDetailEvent, LocalCharacterDetailState> {
  final GetFavoriteCharacterDetailUseCase getFavoriteCharacterDetailUseCase;
  LocalCharacterDetailBloc(this.getFavoriteCharacterDetailUseCase)
      : super(LocalCharacterDetailInitial()) {
    on<GetFavoriteCharacterDetail>(onGetLocalCharacterDetail);
  }

  Future<void> onGetLocalCharacterDetail(GetFavoriteCharacterDetail event,
      Emitter<LocalCharacterDetailState> emit) async {
    emit(LocalCharacterDetailLoading());
    final result =
        await getFavoriteCharacterDetailUseCase.call(params: event.id);
    emit(LocalCharacterDetailLoaded(
      result!,
    ));
  }
}
