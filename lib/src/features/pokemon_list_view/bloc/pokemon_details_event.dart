part of 'pokemon_details_bloc.dart';

sealed class PokemonDetailsEvent extends Equatable {
  const PokemonDetailsEvent();

  @override
  List<Object?> get props => [];
}

class UpdateSelectedTab extends PokemonDetailsEvent {
  final SelectedTab selectedTab;

  const UpdateSelectedTab({required this.selectedTab});

  @override
  List<Object> get props => [selectedTab];
}


class UpdatePokemonListData extends PokemonDetailsEvent {
  const UpdatePokemonListData({this.pokemonList});

  final PokemonList? pokemonList;

  @override
  List<Object?> get props => [ pokemonList ];
}
