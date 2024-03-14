import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokebook_app_assessment/src/core/bloc_providers/pokemon_detail_provider.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokebook_repo.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_list/pokemon_db_list.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_model.dart';
import 'package:pokebook_app_assessment/src/core/shared/theme/theme.dart';
import 'package:pokebook_app_assessment/src/features/pokemon_list_view/bloc/pokemon_details_bloc.dart';

void main() async {
  await _initializedHive();
  await homeDB();
  runApp(const MyApp());
}

/// putting up data in the home db for the home page.
Future<void> homeDB() async {
  final homDB = Pokemon(
      logo: 'assets/logo/noise_book.svg',
      imgPath: 'assets/images/noise_book_logo.svg',
      description:
          'Largest Pokémon index with information about every Pokemon you can think of.');

  PokeBookRepo().savePokemon(0, homDB);
}

/// Mapping multiple Pokemon list into the local pokemon db
Future<void> saveMultiplePokemon() async {
  Map<int, PokemonList> pokemonList = {
    0: PokemonList(
        name: 'charizard',
        imagePath: '',
        about: About(height: '1.0', weight: '13.0', abilities: 'overgrow')),
    1: PokemonList(
        name: 'ivysaur',
        imagePath: '',
        about: About(height: '1.5', weight: '10.0', abilities: 'healthy')),
    2: PokemonList(
        name: 'raticate',
        imagePath: '',
        about: About(height: '0.5', weight: '14.0', abilities: 'Fined')),
    3: PokemonList(
        name: 'beedrill',
        imagePath: '',
        about: About(
          height: '0.5',
          weight: '7.0',
          abilities: 'Insets',
        )),
  };

  PokeBookRepo().saveMultiplePokemon(pokemonList);
}

/// Initialized Hive and registers PokemonAdapter
Future<void> _initializedHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Pokemon>(PokemonAdapter());
  Hive.registerAdapter<PokemonList>(PokemonListAdapter());
  await Hive.openBox<Pokemon>("pokemonBox");
  await Hive.openBox<PokemonList>('pokemonListBox');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<PokemonDetailsBloc>(
            create: (context) => PokemonDetailsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.theme(),
          home: homeProviderOutlet(),
        ),
      ),
    );
  }
}
