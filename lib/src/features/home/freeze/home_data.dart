// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'home_data.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'home_data.g.dart';

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required String logo,
    required String imgPath,
    required String description,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, Object?> json)
  => _$HomeDataFromJson(json);
}