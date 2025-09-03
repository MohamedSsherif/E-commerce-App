import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/domain/product/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductColors extends StatelessWidget {
  final ProductEntity productEntity;
  const ProductColors({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Color',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: productEntity.colors.isNotEmpty
                        ? Color(
                            int.parse('0xFF${productEntity.colors[0].hexCode}'))
                        : Colors.grey,
                    shape: BoxShape.circle,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    // Logic to show size selection dialog or dropdown
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
