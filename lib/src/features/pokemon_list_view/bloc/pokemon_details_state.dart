part of 'pokemon_details_bloc.dart';

class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.activeSelectedTab = SelectedTab.about,
    this.activeSelectedTheme = SelectedTheme.primary,
    this.appStatus = const InitialAppStatus(),
    this.pokemonList,
});

  final SelectedTab activeSelectedTab;
  final AppStatus appStatus;
  final List<PokemonList>? pokemonList;
  final SelectedTheme activeSelectedTheme;

  PokemonDetailsState copyWith({
    SelectedTab? activeTab,
    SelectedTheme? activeTheme,
    AppStatus? appStatus,
    List<PokemonList>? pokemonList,
}) {
    return PokemonDetailsState(
      activeSelectedTab: activeTab ?? activeSelectedTab,
      activeSelectedTheme: activeTheme ?? activeSelectedTheme,
      appStatus: appStatus ?? this.appStatus,
      pokemonList: pokemonList ?? this.pokemonList,
    );
  }
  
  @override
  List<Object> get props => [ activeSelectedTab, activeSelectedTheme ];
}
