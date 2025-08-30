import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

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
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: DefaultColors.sentMessageInput, borderRadius: BorderRadius.circular(12)),
          child: const Icon(Icons.menu, color: Colors.black),
        ),
      ],
    );
  }
}
