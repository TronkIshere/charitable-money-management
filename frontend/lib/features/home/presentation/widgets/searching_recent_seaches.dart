import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class SearchingRecentSearches extends StatefulWidget {
  const SearchingRecentSearches({super.key});

  @override
  State<SearchingRecentSearches> createState() => _SearchingRecentSearchesState();
}

class _SearchingRecentSearchesState extends State<SearchingRecentSearches> {
  final List<String> _recentSearches = [
    'Từ khóa tìm kiếm gần đây 1',
    'Từ khóa tìm kiếm gần đây 2',
    'Từ khóa tìm kiếm gần đây 3',
    'Từ khóa tìm kiếm gần đây 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            'Từ khóa tìm kiếm gần đây',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: DefaultColors.darkText),
          ),
        ),
        _buildSearchList(),
      ],
    );
  }

  Widget _buildSearchList() {
    return Column(
      children: _recentSearches.asMap().entries.map((entry) {
        final index = entry.key;
        final keyword = entry.value;
        return Column(
          children: [
            _buildSearchItem(keyword),
            if (index < _recentSearches.length - 1) Divider(height: 1, thickness: 1, color: DefaultColors.primaryGreen),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildSearchItem(String keyword) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(color: DefaultColors.primaryGreen, borderRadius: BorderRadius.circular(4)),
            child: const Icon(Icons.search, size: 16, color: Colors.white),
          ),
          Expanded(
            child: Text(keyword, style: const TextStyle(fontSize: 16, color: Colors.black87)),
          ),
          IconButton(
            icon: const Icon(Icons.close, size: 20, color: Colors.grey),
            onPressed: () {
              setState(() {
                _recentSearches.remove(keyword);
              });
            },
          ),
        ],
      ),
    );
  }
}
