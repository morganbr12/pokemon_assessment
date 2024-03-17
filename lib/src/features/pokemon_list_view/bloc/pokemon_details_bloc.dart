import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokebook_repo.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_list/pokemon_db_list.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/domain/app_status.dart';

import '../domain/enum_stats.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokeBookRepo pokeBookRepo = PokeBookRepo();

  PokemonDetailsBloc() : super(const PokemonDetailsState()) {
    on<UpdateSelectedTab>(_onUpdateIsSelectedTab);
    on<UpdatePokemonListData>(_onUpdatePokemonList);
    on<UpdatedSelectedTheme>(_onUpdatedTheme);
  }

  void _onUpdateIsSelectedTab(
      UpdateSelectedTab event, Emitter<PokemonDetailsState> emit) {
    try {
      emit(state.copyWith(
          activeTab: event.selectedTab, appStatus: AppStatusUpdated()));
    } finally {
      emit(state.copyWith(appStatus: const InitialAppStatus()));
    }
  }

  void _onUpdatedTheme(
      UpdatedSelectedTheme event, Emitter<PokemonDetailsState> emit) {
    try {
      emit(
        state.copyWith(
            activeTheme: event.selectedTheme, appStatus: AppStatusUpdated()),
      );
    } finally {
      emit(state.copyWith(appStatus: const InitialAppStatus()));
    }
  }

  void _onUpdatePokemonList(
      UpdatePokemonListData event, Emitter<PokemonDetailsState> emit) {
    try {
      final pokemonList = pokeBookRepo.getAllPokemons();

      debugPrint(pokemonList.toString());

      emit(state.copyWith(pokemonList: pokemonList));
    } catch (error) {
      /// Todo: catch error
      debugPrint(error.toString());
    } finally {
      /// Todo: put on initialize
    }
  }
}
