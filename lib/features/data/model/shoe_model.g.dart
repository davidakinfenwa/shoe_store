// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shoe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sneakers _$WelcomeFromJson(Map<String, dynamic> json) => Sneakers(
      createdAt: json['createdAt'] as String,
      name: json['name'] as String,
      imageUrl:
          (json['imageUrl'] as List<dynamic>).map((e) => e as String).toList(),
      oldPrice: json['oldPrice'] as String,
      size: json['size'] as List<dynamic>,
      price: json['price'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$WelcomeToJson(Sneakers instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
      'oldPrice': instance.oldPrice,
      'size': instance.size,
      'price': instance.price,
      'category': instance.category,
      'description': instance.description,
      'title': instance.title,
      'id': instance.id,
    };
