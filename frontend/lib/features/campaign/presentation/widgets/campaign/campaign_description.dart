import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class CampaignDescription extends StatelessWidget {
  final String title;
  final String description;
  final String categoryName;
  final int daysLeft;
  const CampaignDescription({
    super.key,
    required this.title,
    required this.description,
    required this.categoryName,
    required this.daysLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(title),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 18, color: Colors.black, height: 1.5)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoColumn("Danh mục", categoryName),
                Container(width: 1, height: 40, color: DefaultColors.primaryGreen),
                _buildInfoColumn("Còn lại", daysLeft.toString() + " ngày"),
                Container(width: 1, height: 40, color: DefaultColors.primaryGreen),
                _buildInfoColumn("Độ uy tín", "Tốt"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: DefaultColors.darkText),
      textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: false),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: DefaultColors.darkGreen),
          ),
          const SizedBox(height: 5),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
