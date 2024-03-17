import 'package:flutter/cupertino.dart';

import '../../../core/repository/pokemon_list/pokemon_db_list.dart';

class PokemonListJson extends ChangeNotifier {
  final List<PokemonList> _pokemonList = [
    PokemonList(
      name: 'charizard',
      imagePath: '',
      categories: [
        Categories(icon: '', title: 'fire'),
        Categories(icon: '', title: 'fly'),
      ],
      about: About(
        height: '1.0',
        weight: '13.0',
        abilities: 'overgrow',
      ),
    ),
    PokemonList(
      name: 'ivysaur',
      imagePath: '',
      categories: [
        Categories(icon: '', title: 'fire'),
        Categories(icon: '', title: 'fly'),
      ],
      about: About(
        height: '1.5',
        weight: '10.0',
        abilities: 'healthy',
      ),
    ),
    PokemonList(
      name: 'raticate',
      imagePath: '',
      categories: [
        Categories(icon: '', title: 'fire'),
        Categories(icon: '', title: 'fly'),
      ],
      about: About(
        height: '0.5',
        weight: '14.0',
        abilities: 'Fined',
      ),
    ),
    PokemonList(
        name: 'beedrill',
        imagePath: '',
        categories: [
          Categories(icon: '', title: 'fire'),
          Categories(icon: '', title: 'fly'),
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
