import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductQuantity extends StatelessWidget {
  const ProductQuantity({super.key});

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
                  'Quantity',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    // Logic to decrease quantity
                  },
                ),
                Text(
                  '1', // This should be dynamic based on the selected quantity
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Logic to increase quantity
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
