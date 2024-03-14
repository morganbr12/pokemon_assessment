import 'package:hive/hive.dart';

part 'pokemon_db_list.g.dart';

@HiveType(typeId: 2)
class PokemonList {
  @HiveField(0)
  String name;

  @HiveField(1)
  String imagePath;

  @HiveField(2)
  About? about;

  PokemonList({required this.name, required this.imagePath, this.about});
}

@HiveType(typeId: 3)
class About {
  @HiveField(0)
  String height;

  @HiveField(1)
  String weight;

  @HiveField(2)
  String abilities;

  About({required this.height, required this.weight, required this.abilities});
}
