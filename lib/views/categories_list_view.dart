import 'package:final_project/views/category_card.dart';
import 'package:final_project/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryCard(
          category: categories[index],
        );
      },
    );
  }
}
