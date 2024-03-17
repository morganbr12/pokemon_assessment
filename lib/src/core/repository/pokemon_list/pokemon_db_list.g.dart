// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_db_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PokemonListAdapter extends TypeAdapter<PokemonList> {
  @override
  final int typeId = 2;

  @override
  PokemonList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PokemonList(
      name: fields[0] as String,
      imagePath: fields[1] as String,
      categories: (fields[3] as List).cast<Categories>(),
      about: fields[2] as About?,
    );
  }

  @override
  void write(BinaryWriter writer, PokemonList obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.imagePath)
      ..writeByte(3)
      ..write(obj.categories)
      ..writeByte(2)
      ..write(obj.about);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PokemonListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AboutAdapter extends TypeAdapter<About> {
  @override
  final int typeId = 3;

  @override
  About read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return About(
      height: fields[0] as String,
      weight: fields[1] as String,
      abilities: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, About obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.height)
      ..writeByte(1)
      ..write(obj.weight)
      ..writeByte(2)
      ..write(obj.abilities);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AboutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoriesAdapter extends TypeAdapter<Categories> {
  @override
  final int typeId = 4;

  @override
  Categories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categories(
      icon: fields[0] as String,
      title: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categories obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.icon)
      ..writeByte(1)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
