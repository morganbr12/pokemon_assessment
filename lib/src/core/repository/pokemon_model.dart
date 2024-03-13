import 'package:hive/hive.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 1)
class Pokemon {
  @HiveField(0)
  String logo;
  
  @HiveField(1)
  String imgPath;

  @HiveField(2)
  String? description;

  Pokemon({required this.logo, required this.imgPath, this.description});

}