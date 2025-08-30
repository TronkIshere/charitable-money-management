import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class SearchingSearchBar extends StatefulWidget {
  const SearchingSearchBar({super.key});

  @override
  State<SearchingSearchBar> createState() => _SearchingSearchBarState();
}

class _SearchingSearchBarState extends State<SearchingSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: DefaultColors.sentMessageInput,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: const TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
                hintText: "Tìm kiếm...",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: DefaultColors.sentMessageInput,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: _handleCancel,
          child: Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Hủy',
              style: TextStyle(color: DefaultColors.darkText, fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  void _handleCancel() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }
}
