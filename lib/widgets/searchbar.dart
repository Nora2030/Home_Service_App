import 'package:flutter/material.dart';
import 'package:final_project/widgets/selectD&T_widget.dart'; // Import the select date and time widget

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  List<String> _filteredResults = [];

  final List<Category> categories = [
    Category('Category 1', ['Subcategory 1.1', 'Subcategory 1.2']),
    Category('Category 2', ['Subcategory 2.1', 'Subcategory 2.2']),
    // Add more categories and subcategories as needed
  ];

  void _filterResults(String query) {
    final results = <String>[];
    for (var category in categories) {
      if (category.name.toLowerCase().contains(query.toLowerCase())) {
        results.add(category.name);
      }
      for (var subcategory in category.subcategories) {
        if (subcategory.toLowerCase().contains(query.toLowerCase())) {
          results.add(subcategory);
        }
      }
    }
    setState(() {
      _filteredResults = results;
    });
  }

  void _onResultTap(String result) {
    for (var category in categories) {
      if (category.name == result) {
        // Navigate to category page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: category),
          ),
        );
        return;
      }
      for (var subcategory in category.subcategories) {
        if (subcategory == result) {
          // Navigate to subcategory page and show select date and time widget
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SubcategoryPage(subcategory: subcategory),
            ),
          );
          return;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize:
          MainAxisSize.min, // Ensure the column does not expand infinitely
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 480, // Set the maximum width
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  onChanged: _filterResults,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.indigo,
                ),
                onPressed: () {
                  _filterResults(_controller.text);
                },
              ),
            ],
          ),
        ),
        if (_filteredResults.isNotEmpty)
          Container(
            width: 240, // Set the width to half of the search bar's width
            constraints: const BoxConstraints(
              maxHeight:
                  200, // Set a maximum height for the recommendations list
            ),
            margin: const EdgeInsets.only(
                top:
                    8.0), // Add some margin to position it below the search bar
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap:
                  true, // Ensure the ListView does not expand infinitely
              itemCount: _filteredResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredResults[index]),
                  onTap: () => _onResultTap(_filteredResults[index]),
                );
              },
            ),
          ),
      ],
    );
  }
}

class Category {
  final String name;
  final List<String> subcategories;

  Category(this.name, this.subcategories);
}

class CategoryPage extends StatelessWidget {
  final Category category;

  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: Center(
        child: Text('Welcome to ${category.name} page!'),
      ),
    );
  }
}

class SubcategoryPage extends StatelessWidget {
  final String subcategory;

  const SubcategoryPage({super.key, required this.subcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subcategory),
      ),
      body: const Center(
        child: Selectdatetime(), // Show select date and time widget
      ),
    );
  }
}
