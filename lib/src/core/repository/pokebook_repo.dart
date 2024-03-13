import 'package:hive/hive.dart';
import 'package:pokebook_app_assessment/src/core/repository/pokemon_model.dart';

class PokeBookRepo {
  late Box<Pokemon> pokemonBox;

  // Gets already opened box and assign it to pokemonBox.
  PokeBookRepo() {
    pokemonBox = Hive.box("pokemonBox");
  }

  /// Save a single pokemon in the box.
  void savePokemon(int key, Pokemon pokemon) => pokemonBox.put(key, pokemon);

  /// Save multiple pokemons in the box.
  void saveMultiplePokemon(Map<int, Pokemon> pokemons) =>
      pokemonBox.putAll(pokemons);

  /// Returns all saved pokemons in the box.
  List<Pokemon> getAllPokemons() => pokemonBox.values.toList();

  /// Returns a single Pokemon object when called
  Pokemon? getPokemon(int key) => pokemonBox.get(key);

  /// Call this function to listen to changes in the box in real time.
  Stream<BoxEvent> watchBoxChanges() => pokemonBox.watch();

  /// Update a pokemon record in the box
  void updatePokemon(int key, Pokemon pokemon) {
    Pokemon? record = pokemonBox.get(key);
    if (record == null) pokemonBox.put(key, pokemon);
  }

  /// Delete a single pokemon object from the box matching the key provide.
  void deletePokemon(int key) => pokemonBox.delete(key);

  /// Deletes multiple pokemons from the  box matching list of keys provided.
  void deletePokemons(List<int> keys) => pokemonBox.deleteAll(keys);

  /// clears all pokemons in the box
  void clearBox() => pokemonBox.clear();

  /// close all instances of opened box
  void closeBox() => pokemonBox.close();
}
