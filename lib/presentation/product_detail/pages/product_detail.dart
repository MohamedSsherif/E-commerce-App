import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:ecommerce/presentation/product_detail/widgets/add_to_bag.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_colors.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_images.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_price.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_quantity.dart';
import 'package:ecommerce/presentation/product_detail/widgets/product_title.dart';
import 'package:ecommerce/presentation/product_detail/widgets/selected_size.dart';
import 'package:flutter/material.dart';


class ProductDetailPage extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductDetailPage({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImages(productEntity: productEntity),
            SizedBox(height: 8,),
            ProductTitle(productEntity: productEntity),
            SizedBox(height: 8,),
            ProductPrice(productEntity: productEntity),
            SizedBox(height: 40,),
            SelectedSize(productEntity: productEntity,),
            SizedBox(height: 16,),
            ProductColors(productEntity: productEntity,),
            SizedBox(height: 16,),
            ProductQuantity(),
            SizedBox(height: 34,),
            AddToBag(productEntity: productEntity),
            
          ],
        ),
      )
       
    );
  }
}