import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/repository/pokebook_repo.dart';
import '../../../core/repository/pokemon_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  PokeBookRepo pokeBookRepo = PokeBookRepo();


  HomeBloc() : super(const HomeState()) {
    on<UpdateHomeData>(_getHomeData);
  }

  void _getHomeData(UpdateHomeData event, Emitter<HomeState> emit) async {
    try {
      final home = pokeBookRepo.getPokemon(0);

      emit(state.copyWith(homeData: home));

    } catch (error) {
    //   Todo: write what error should be handled
      debugPrint(error.toString());
    } finally {
    //   Todo: write what should do when the result comes
    }
  }
}
