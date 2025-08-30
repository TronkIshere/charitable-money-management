import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class HomeCategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const HomeCategoryItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: DefaultColors.primaryGreen,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))],
          ),
          child: Icon(icon, color: Colors.white, size: 40),
        ),
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 14),
        ),
      ],
    );
  }
}
