import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokebook_repo.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_model.dart';
import 'package:pokebook_app_assessment/src/core/shared/theme/theme.dart';
import 'package:pokebook_app_assessment/src/features/home/ui/home_screen.dart';

void main() async {
  await _initializedHive();
  await homeDB();


  runApp(const MyApp());
}

/// setting up the data in the hive db for the home page.
Future<void> homeDB() async {
  Map<int, Pokemon> pokemonHome = {
    0: Pokemon(
      logo: 'assets/logo/noise_book.svg',
      imgPath: 'assets/images/noise_book_logo.svg',
      description: 'Largest Pokémon index with information about every Pokemon you can think of.'
    ),
  };

  PokeBookRepo().saveMultiplePokemon(pokemonHome);
}

/// Initialized Hive and registers PokemonAdapter
Future<void> _initializedHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Pokemon>(PokemonAdapter());
  await Hive.openBox<Pokemon>("pokemonBox");
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppThemeData.theme(),
        home: const MyHomePage(title: 'PokeBook Home Page'),
      ),
    );
  }
}
