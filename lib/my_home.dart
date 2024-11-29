import 'package:final_project/widgets/searchbar.dart' as custom;
import 'package:final_project/views/OffersListView.dart';
import 'package:final_project/views/categories_list_view.dart';
import 'package:flutter/material.dart';

import 'screens/CategoriesPage.dart';
import 'widgets/CustomAppBar.dart';

class MyHome extends StatelessWidget {
  const MyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Using SliverAppBar to make the custom AppBar floating
          const SliverAppBar(
            floating: true,
            pinned: true, // Keeps the AppBar visible at the top when collapsed
            snap: false,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  CustomAppBar(currentPage: 'home'), // Your custom AppBar
            ),
          ),
          const WelcomeSentence(), // SliverToBoxAdapter for static content for welcome sentence
          const SizedBoxWidget(),

          const SearchBox(), // SliverToBoxAdapter for search bar
          const SizedBoxWidget(),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("OUR SERVICES",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoriesPage()),
                        );
                      },
                      child: const Text(
                        'See All',
                        // style: TextStyle(
                        //     // color: Colors.blue,
                        //     // fontSize: 20,
                        //     ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SliverToBoxAdapter(
              child: SizedBox(
            height: 120,
            child: CategoriesListView(),
          )),
          const SizedBoxWidget(),
          const SliverFillRemaining(child: OffersListView()),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter for static content for welcome sentence
class WelcomeSentence extends StatelessWidget {
  const WelcomeSentence({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Experience the comfort of a well-maintained Home with our expert services!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// SliverToBoxAdapter for search bar
class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
        child: Center(
      child: custom.SearchBar(),
    ));
  }
}

// SizedBox for spacing
class SizedBoxWidget extends StatelessWidget {
  const SizedBoxWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 16,
      ),
    );
  }
}
