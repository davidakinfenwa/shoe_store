import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shoe_model.g.dart';

List<Sneakers> welcomeFromJson(String str) => List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));



@JsonSerializable()
class Sneakers extends Equatable {
  final String createdAt;
  final String name;
  final List<String> imageUrl;
  final String oldPrice;
  final List<dynamic> size;
  final String price;
  final String category;
  final String description;
  final String title;
  final String id;

  const Sneakers({
    required this.createdAt,
    required this.name,
    required this.imageUrl,
    required this.oldPrice,
    required this.size,
    required this.price,
    required this.category,
    required this.description,
    required this.title,
    required this.id,
  });

  Sneakers copyWith({
    String? createdAt,
    String? name,
    List<String>? imageUrl,
    String? oldPrice,
    List<dynamic>? size,
    String? price,
    String? category,
    String? description,
    String? title,
    String? id,
  }) =>
      Sneakers(
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        imageUrl: imageUrl ?? this.imageUrl,
        oldPrice: oldPrice ?? this.oldPrice,
        size: size ?? this.size,
        price: price ?? this.price,
        category: category ?? this.category,
        description: description ?? this.description,
        title: title ?? this.title,
        id: id ?? this.id,
      );

  factory Sneakers.fromJson(Map<String, dynamic> json) =>
      _$WelcomeFromJson(json);

  Map<String, dynamic> toJson() => _$WelcomeToJson(this);

  @override

  List<Object?> get props => [
        "createdAt",
        "name",
        "imageUrl",
        "oldPrice",
        "size",
        "price",
        "category",
        "description",
        "title",
        "id"
      ];
}

class Size {
  final String size;
  final bool isSelected;

  Size({
    required this.size,
    required this.isSelected,
  });

  Size copyWith({
    String? size,
    bool? isSelected,
  }) =>
      Size(
        size: size ?? this.size,
        isSelected: isSelected ?? this.isSelected,
      );

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        size: json["size"],
        isSelected: json["isSelected"],
      );

  Map<String, dynamic> toJson() => {
        "size": size,
        "isSelected": isSelected,
      };
}
