part of 'pokemon_details_bloc.dart';

class PokemonDetailsState extends Equatable {
  const PokemonDetailsState({
    this.activeSelectedTab = SelectedTab.about,
    this.appStatus = const InitialAppStatus(),
});

  final SelectedTab activeSelectedTab;
  final AppStatus appStatus;

  PokemonDetailsState copyWith({
    SelectedTab? activeTab,
    AppStatus? appStatus,
}) {
    return PokemonDetailsState(
      activeSelectedTab: activeTab ?? activeSelectedTab,
      appStatus: appStatus ?? this.appStatus,
    );
  }
  
  @override
  List<Object> get props => [ activeSelectedTab ];
}
