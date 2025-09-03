import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:flutter/widgets.dart';

class ProductImages extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductImages({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 180,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    productEntity.image.isEmpty
                        ? 'https://static.vecteezy.com/system/resources/previews/024/983/914/large_2x/simple-user-default-icon-free-png.png'
                        :
                        //productEntity.image[0],
                        productEntity.image[index],
                    //ImageDisplayHelper.generateProductImageURL(productEntity.image[0])
                  ),
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            );
            
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: productEntity.image.length,
      
        ),
      ),
    );
  }
}
