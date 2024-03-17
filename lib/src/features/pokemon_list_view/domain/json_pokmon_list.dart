import 'package:flutter/cupertino.dart';
import 'package:pokebook_app_assessment/src/core/shared/image_constants/image_constant.dart';

import '../../../core/repository/pokemon_list/pokemon_db_list.dart';

class PokemonListJson extends ChangeNotifier {
  final List<PokemonList> _pokemonList = [
    PokemonList(
      name: 'charizard',
      imagePath: ImageConstants.kCharizard,
      categories: [
        Categories(icon: '', title: '🔥 Fire'),
        Categories(icon: '', title: '🦋 Flying'),
      ],
      about: About(
        height: '1.0',
        weight: '13.0',
        abilities: 'overgrow',
      ),
    ),
    PokemonList(
      name: 'ivysaur',
      imagePath: ImageConstants.kIvysaur,
      categories: [
        Categories(icon: '', title: '🌿 Grass'),
        Categories(icon: '', title: '☠ Poison'),
      ],
      about: About(
        height: '1.5',
        weight: '10.0',
        abilities: 'healthy',
      ),
    ),
    PokemonList(
      name: 'raticate',
      imagePath: ImageConstants.kRaticate,
      categories: [
        Categories(icon: '', title: '🐻 Normal'),
      ],
      about: About(
        height: '0.5',
        weight: '14.0',
        abilities: 'Fined',
      ),
    ),
    PokemonList(
        name: 'beedrill',
        imagePath: ImageConstants.kBreedrill,
        categories: [
          Categories(icon: '', title: '🐞 Bug'),
          Categories(icon: '', title: '☠ Poison'),
        ],
        about: About(
          height: '0.5',
          weight: '7.0',
          abilities: 'Insets',
        )),
  ];

  List<PokemonList> get getPokemonList {
    return [..._pokemonList];
  }
}
