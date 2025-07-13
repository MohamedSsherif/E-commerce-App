import 'package:ecommerce/presentation/home/widgets/categories.dart';
import 'package:ecommerce/presentation/home/widgets/header.dart';
import 'package:ecommerce/presentation/home/widgets/new_in.dart';
import 'package:ecommerce/presentation/home/widgets/search_field.dart';
import 'package:ecommerce/presentation/home/widgets/top_selling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 20),
            const SearchField(),
            const SizedBox(height: 20),
            const Categories(),
            const SizedBox(height: 20),
            const TopSelling(),
            const SizedBox(height: 20),
            const NewIn(),
        
          ],
        ),
      ),
    );
  }
}
