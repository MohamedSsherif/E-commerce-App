import 'dart:convert';

import 'package:ecommerce/domain/category/entity/category.dart';

class CategoryModel {
  final String title;
  final String categoryId;
  final String image;

  CategoryModel({
    required this.title,
    required this.categoryId,
    required this.image,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'categoryId': categoryId,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title']?.toString() ?? '',
      categoryId: map['categoryId']?.toString() ?? '',
      image: map['image']?.toString() ?? '',
    );
  }
 

  String toJson() => json.encode(toMap());
  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      title: title,
      categoryId: categoryId,
      image: image,
    );
  }
}
