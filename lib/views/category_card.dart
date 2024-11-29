// import 'package:final_project/views/categories_list_view.dart';
import 'package:final_project/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => category.pageName),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 180,
          // height: 120,
          constraints: const BoxConstraints(
            maxHeight: 120,
            maxWidth: 180,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage(category.image),
                fit: BoxFit.fill,
                opacity: .75),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity, // Make the container take the full width
              padding: const EdgeInsets.all(8.0),
              color: Colors.black54, // Background color for the container
              child: Text(
                category.categoryName,
                textAlign: TextAlign.center, // Center the text
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
