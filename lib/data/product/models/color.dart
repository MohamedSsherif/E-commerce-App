// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:ecommerce/domain/product/entities/color.dart';

class ProductColorModel {

  final String title;
  //final List<int> rgb;
  final String hexCode;

  ProductColorModel({
    required this.title,
    //required this.rgb,
    required this.hexCode,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      //'rgb': rgb,
      'hexCode': hexCode,
    };
  }

  // factory ProductColorModel.fromMap(Map<String, dynamic> map) {
  //   return ProductColorModel(
  //     title: map['title'] as String,
  //     rgb: List < int > .from(
  //       map['rgb'].map((e) => e),
  //     ),
  //   );
  // }

  factory ProductColorModel.fromMap(Map<String, dynamic> map) {
  return ProductColorModel(
    title: map['title'] as String,
    // rgb: map['rgb'] != null
    //     ? List<int>.from(map['rgb'])
    //     : [],
    hexCode: map['hexCode'] as String,

  );
}

}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      //rgb: rgb
      hexCode: hexCode,
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      title: title,
      //rgb: rgb
      hexCode: hexCode,
    );
  }
}
