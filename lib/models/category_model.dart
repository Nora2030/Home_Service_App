import 'package:final_project/screens/SettingsPage.dart';
import 'package:final_project/screens/subcategory_screen.dart';
import 'package:flutter/material.dart';
class CategoryModel {
  final String image;
  final String categoryName;
  final Widget pageName;

  const CategoryModel(
      {required this.image,
      required this.categoryName,
      required this.pageName});
}

List<CategoryModel> categories = [
  const CategoryModel(
    image: 'assets/Cleaning Services.jpeg',
    categoryName: 'Cleaning Services',
    pageName: SettingsPage(),
  ),
  CategoryModel(
    image: 'assets/Landscaping.jpeg',
    categoryName: 'Landscaping',
    pageName: SubCategory_screen(),
  ),
  const CategoryModel(
    image: 'assets/electricals.jpeg',
    categoryName: 'Electrical Services',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/Paintingsjpeg.jpeg',
    categoryName: 'Paintings',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/shiftingjpeg.jpeg',
    categoryName: 'Shifting Services',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/Appliance Repair.jpeg',
    categoryName: 'Appliance Repair',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/handyman.jpeg',
    categoryName: 'Handyman Services',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/Home Security.jpeg',
    categoryName: 'Home Security',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/Pest Control.jpeg',
    categoryName: 'Pest Control',
    pageName: SettingsPage(),
  ),
  const CategoryModel(
    image: 'assets/plumbing.jpeg',
    categoryName: 'Plumbing Services',
    pageName: SettingsPage(),
  ),
];
