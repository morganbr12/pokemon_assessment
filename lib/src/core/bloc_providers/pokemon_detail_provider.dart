import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokebook_app_assessment/src/features/home/bloc/home_bloc.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/bloc/pokemon_details_bloc.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/ui/pokemon_list_view.dart';

import '../../features/home/ui/home_screen.dart';

Widget pokemonDetailProvider() {
  return BlocProvider(
    create: (context) => PokemonDetailsBloc(),
    child: const PokeMonListViewScreen(),
  );
}

Widget homeProviderOutlet() {
  return BlocProvider(
    create: (context) => HomeBloc(),
    child: const MyHomePage(
      title: 'mee',
    ),
  );
}
