import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  final String image;
  final String offerName;
  final String offerAmount;
  final String offerInfo;

  OfferModel({
    required this.image,
    required this.offerName,
    required this.offerAmount,
    required this.offerInfo,
  });

  factory OfferModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return OfferModel(
      image: data['image'] ?? '',
      offerName: data['offerName'] ?? '',
      offerAmount: data['offerAmount'] ?? '',
      offerInfo: data['offerInfo'] ?? '',
    );
  }
}












// import 'package:final_project/SettingsPage.dart';
// import 'package:final_project/views/category_card.dart';
// import 'package:final_project/views/category_model.dart';
// import 'package:flutter/material.dart';

// class CategoriesvListView extends StatelessWidget {
//   const CategoriesvListView({super.key});

//   final List<CategoryModel> categorie = const [
//     CategoryModel(
//       image: 'assets/business.avif',
//       categoryName: 'Business',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/entertaiment.avif',
//       categoryName: 'Entertainment',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/health.avif',
//       categoryName: 'Health',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/science.avif',
//       categoryName: 'Science',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/technology.jpeg',
//       categoryName: 'Technology',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/sports.avif',
//       categoryName: 'Sports',
//       pageName: SettingsPage(),
//     ),
//     CategoryModel(
//       image: 'assets/general.avif',
//       categoryName: 'General',
//       pageName: SettingsPage(),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       scrollDirection: Axis.vertical,
//       itemCount: categorie.length,
//       itemBuilder: (context, index) {
//         return CategoryCard(
//           category: categorie[index],
//         );
//       },
//     );
//   }
// }
