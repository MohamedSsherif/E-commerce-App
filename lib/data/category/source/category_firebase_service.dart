import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/category/models/category.dart';

abstract class CategoryFirebaseService {
  Future<Either<String, List<CategoryModel>>> getCategories();
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      var categories =
          await FirebaseFirestore.instance.collection('categories').get();
      return Right(categories.docs
          .map((doc) => CategoryModel.fromMap(doc.data()))
          .toList());
    } catch (e) {
      return Left('Error fetching categories: $e');
    }
  }
}
