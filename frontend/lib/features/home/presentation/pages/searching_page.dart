import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentation/widgets/searching_recent_seaches.dart';
import 'package:frontend/features/home/presentation/widgets/searching_search_bar.dart';

class SearchingPage extends StatefulWidget {
  const SearchingPage({super.key});

  @override
  State<SearchingPage> createState() => _SearchingPageState();
}

class _SearchingPageState extends State<SearchingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            const SearchingSearchBar(),
            const SizedBox(height: 24),
            SearchingRecentSearches(),
          ],
        ),
      ),
    );
  }
}
