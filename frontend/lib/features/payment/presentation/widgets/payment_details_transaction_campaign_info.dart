import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentDetailsTransactionCampaignInfo extends StatelessWidget {
  final String campaignTitle;
  final String campaignImage;
  final String campaignDescription;
  const PaymentDetailsTransactionCampaignInfo({
    super.key,
    required this.campaignTitle,
    required this.campaignImage,
    required this.campaignDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          campaignTitle,
          style: const TextStyle(fontWeight: FontWeight.w600, color: DefaultColors.darkText, fontSize: 18),
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(campaignImage, fit: BoxFit.cover, height: 250, width: double.infinity),
        ),
        const SizedBox(height: 10),
        Text(
          campaignDescription,
          style: const TextStyle(fontWeight: FontWeight.w600, color: DefaultColors.greyText, fontSize: 18),
        ),
      ],
    );
  }
}
