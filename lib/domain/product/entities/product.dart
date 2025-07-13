import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/product/models/color.dart';
import 'package:ecommerce/domain/product/entities/color.dart';

class ProductEntity {
     final String categoryId;
  final List < ProductColorEntity > colors;
  final num discountedPrice;
  final int gender;
  final List < String > image;
  final num price;
  final List < String > sizes;
  final String productId;
  final int salesNumber;
  final String title;
  final Timestamp createdDate;


  ProductEntity({
    required this.categoryId,
    required this.colors,
    required this.discountedPrice,
    required this.gender,
    required this.image,
    required this.price,
    required this.sizes,
    required this.productId,
    required this.salesNumber,
    required this.createdDate,
    required this.title,
  });

}