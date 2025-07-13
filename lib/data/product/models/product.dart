// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/domain/product/entities/color.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'color.dart';

class ProductModel {
  final String categoryId;
  final List < ProductColorModel > colors;
  final num discountedPrice;
  final int gender;
  final List < String > image;
  final num price;
  final List < String > sizes;
  final String productId;
  final int salesNumber;
  final String title;
  final Timestamp createdDate;

  ProductModel({
    required this.categoryId,
    required this.colors,
    required this.discountedPrice,
    required this.gender,
    required this.image,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.title,
    required this.createdDate
  });

 
  // factory ProductModel.fromMap(Map<String, dynamic> map) {
  //   return ProductModel(
  //     categoryId: map['categoryId'] as String,
  //     colors: List<ProductColorModel>.from(
  //       map['colors'].map((e)=> ProductColorModel.fromMap(e as Map<String, dynamic>)),
  //     ),

  //     discountedPrice: map['discountedPrice'] as num,
  //     gender: map['gender'] as int,
  //     images: List < String >.from(
  //       map['images'].map((e) => e.toString()),
  //     ),
  //     price: map['price'] as num,
  //     sizes: List < String >.from(
  //       map['sizes'].map((e) => e.toString()),
  //     ),
  //     productId: map['productId'] as String,
  //     salesNumber: map['salesNumber'] as int,
  //     title: map['title'] as String,
  //   );
  // }

factory ProductModel.fromMap(Map<String, dynamic> map) {
  return ProductModel(
    categoryId: map['categoryId'] ?? '',
    
    colors: map['colors'] != null
        ? List<ProductColorModel>.from(
            map['colors'].map((e) => ProductColorModel.fromMap(e as Map<String, dynamic>)),
          )
        : [],

    discountedPrice: map['discountedPrice'] ?? 0,
    gender: map['gender'] ?? 0,
    
    image: map['image'] != null
        ? List<String>.from(map['image'].map((e) => e.toString()))
        : [],

    price: map['price'] ?? 0,

    sizes: map['sizes'] != null
        ? List<String>.from(map['sizes'].map((e) => e.toString()))
        : [],

    productId: map['productId'] ?? '',
    salesNumber: map['salesNumber'] ?? 0,
    title: map['title'] ?? '',
  createdDate: map['createdDate'] != null ? map['createdDate'] as Timestamp : Timestamp.now(),

  );
}


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryId': categoryId,
      'colors': colors.map((color) => color.toMap()).toList(),
      'discountedPrice': discountedPrice,
      'gender': gender,
      'image': image.map((e) => e.toString()).toList(),
      'price': price,
      'sizes': sizes.map((e) => e.toString()).toList(),
      'productId': productId,
      'salesNumber': salesNumber,
      'title': title,
      'createdDate': createdDate
    };
  }

}


extension ProductXModel on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId: categoryId,
      colors: colors.map((e) => e.toEntity()).toList(),
      discountedPrice: discountedPrice,
      gender: gender,
      image: image, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title,
      createdDate: createdDate,
    );
  }
}

extension ProductXEntity on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId: categoryId,
      colors: colors.map((e) => e.fromEntity()).toList(),
      discountedPrice: discountedPrice,
      gender: gender,
      image: image, 
      price: price,
      sizes: sizes, 
      productId: productId, 
      salesNumber: salesNumber, 
      title: title,
      createdDate: createdDate,
    );
  }
}


