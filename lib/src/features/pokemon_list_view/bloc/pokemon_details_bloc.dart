import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/domain/app_status.dart';

import '../domain/enum_stats.dart';

part 'pokemon_details_event.dart';
part 'pokemon_details_state.dart';

class PokemonDetailsBloc
    extends Bloc<PokemonDetailsEvent, PokemonDetailsState> {
  PokemonDetailsBloc() : super(const PokemonDetailsState()) {
    on<UpdateSelectedTab>(_onUpdateIsSelectedTab);
  }

  void _onUpdateIsSelectedTab(
      UpdateSelectedTab event, Emitter<PokemonDetailsState> emit) {
    try {
      emit(state.copyWith(
          activeTab: event.selectedTab, appStatus: QrStatusUpdated()));
    } finally {
      emit(state.copyWith(appStatus: const InitialAppStatus()));
    }
  }
}
