// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['_id'] as String,
  title: json['title'] as String? ?? '',
  description: json['description'] as String? ?? '',
  price: (json['price'] as num?)?.toInt() ?? 0,
  category: json['category'] as String? ?? '',
  brand: json['brand'] as String? ?? '',
  image: json['image'] as String? ?? '',
  createdAt: json['createdAt'] as String? ?? '',
  updatedAt: json['updatedAt'] as String? ?? '',
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'description': instance.description,
  'price': instance.price,
  'category': instance.category,
  'brand': instance.brand,
  'image': instance.image,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
