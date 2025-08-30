import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/home/presentation/widgets/home_category_item.dart';

class HomeCategoryList extends StatelessWidget {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Danh mục",
          style: TextStyle(color: DefaultColors.greyText, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            HomeCategoryItem(title: "Sức khỏe", icon: Icons.health_and_safety),
            HomeCategoryItem(title: "Thiên nhiên", icon: Icons.nature),
            HomeCategoryItem(title: "Giáo dục", icon: Icons.school),
            HomeCategoryItem(title: "Xem thêm", icon: Icons.more_horiz),
          ],
        ),
      ],
    );
  }
}
