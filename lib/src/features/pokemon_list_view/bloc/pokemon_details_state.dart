part of 'pokemon_details_bloc.dart';

class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.activeSelectedTab = SelectedTab.about,
    this.appStatus = const InitialAppStatus(),
    this.pokemonList,
});

  final SelectedTab activeSelectedTab;
  final AppStatus appStatus;
  final List<PokemonList>? pokemonList;

  PokemonDetailsState copyWith({
    SelectedTab? activeTab,
    AppStatus? appStatus,
    List<PokemonList>? pokemonList,
}) {
    return PokemonDetailsState(
      activeSelectedTab: activeTab ?? activeSelectedTab,
      appStatus: appStatus ?? this.appStatus,
      pokemonList: pokemonList ?? this.pokemonList,
    );
  }
  
  @override
  List<Object> get props => [ activeSelectedTab ];
}
