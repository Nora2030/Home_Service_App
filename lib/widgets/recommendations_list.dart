import 'package:flutter/material.dart';

class RecommendationsList extends StatelessWidget {
  final List<String> recommendations;
  final Function(String) onResultTap;
  final VoidCallback onOutsideTap;

  const RecommendationsList({
    required this.recommendations,
    required this.onResultTap,
    required this.onOutsideTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOutsideTap,
      child: Container(
        color: Colors.transparent, // Transparent color to detect taps outside
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            elevation: 4.0,
            child: Container(
              width: 240, // Set the width to half of the search bar's width
              constraints: const BoxConstraints(
                maxHeight:
                    200, // Set a maximum height for the recommendations list
              ),
              color: Colors.white,
              child: ListView.builder(
                shrinkWrap:
                    true, // Ensure the ListView does not expand infinitely
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(recommendations[index]),
                    onTap: () => onResultTap(recommendations[index]),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
