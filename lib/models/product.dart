import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'product.g.dart';

part 'product.freezed.dart';


@freezed
abstract class Product with _$Product {

  const factory Product({
    @JsonKey(name: '_id') required String id,
    @Default('') String title,
    @Default('') String description,
    @Default(0) int price,
    @Default('') String category,
    @Default('') String brand,
    @Default('') String image,
    @Default('') String createdAt,
    @Default('') String updatedAt,





}) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>_$ProductFromJson(json);

}
