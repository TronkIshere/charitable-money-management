import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class HomeCampaignItem extends StatelessWidget {
  final String title;
  final String organization;
  final int daysLeft;
  final double raisedAmount;
  final double goalAmount;
  final String imageUrl;

  const HomeCampaignItem({
    super.key,
    required this.title,
    required this.organization,
    required this.daysLeft,
    required this.raisedAmount,
    required this.goalAmount,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = (raisedAmount / goalAmount).clamp(0.0, 1.0);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Campaign image
          _buildCampaignImage(),
          const SizedBox(width: 12),

          // Campaign content
          _buildCampaignContent(progress),
        ],
      ),
    );
  }

  Widget _buildCampaignImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
        width: 120,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 120,
          height: 120,
          color: Colors.grey[300],
          child: const Icon(Icons.image, color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildCampaignContent(double progress) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          const SizedBox(height: 4),
          _buildOrganization(),
          _buildDaysLeft(),
          _buildAmountInfo(),
          const SizedBox(height: 8),
          _buildProgressBar(progress),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: DefaultColors.darkText),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildOrganization() {
    return Text(
      organization,
      style: const TextStyle(color: DefaultColors.greyText, fontSize: 14),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildDaysLeft() {
    return Text("$daysLeft ngày còn lại", style: const TextStyle(color: DefaultColors.greyText, fontSize: 14));
  }

  Widget _buildAmountInfo() {
    return Text(
      "${_formatCurrency(raisedAmount)} / ${_formatCurrency(goalAmount)} VNĐ",
      style: const TextStyle(color: DefaultColors.greyText, fontSize: 14, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildProgressBar(double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: LinearProgressIndicator(
        value: progress,
        minHeight: 8,
        backgroundColor: Colors.grey[300],
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }

  String _formatCurrency(double amount) {
    final String amountString = amount.toStringAsFixed(0);
    final StringBuffer formatted = StringBuffer();

    int count = 0;
    for (int i = amountString.length - 1; i >= 0; i--) {
      formatted.write(amountString[i]);
      count++;
      if (count % 3 == 0 && i != 0) {
        formatted.write('.');
      }
    }

    return formatted.toString().split('').reversed.join('');
  }
}
