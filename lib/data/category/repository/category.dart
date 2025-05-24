import 'package:dartz/dartz.dart';
import 'package:ecommerce/data/category/models/category.dart';
import 'package:ecommerce/data/category/source/category_firebase_service.dart';
import 'package:ecommerce/domain/category/entity/category.dart';
import 'package:ecommerce/domain/category/repository/category.dart';
import 'package:ecommerce/service_locator.dart';



class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    var categories = await sl<CategoryFirebaseService>().getCategories();
    return categories.fold(
      (error) => Left(error),
      (data) => Right(data.map((model) => model.toEntity()).toList()),
    );
  }
}


