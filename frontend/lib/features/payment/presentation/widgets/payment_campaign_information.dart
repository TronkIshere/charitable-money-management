import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentCampaignInformation extends StatelessWidget {
  final String image;
  final String title;
  final String organization;
  const PaymentCampaignInformation({super.key, required this.image, required this.title, required this.organization});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(image, fit: BoxFit.cover, height: 250, width: double.infinity),
        ),
        Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                organization,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: DefaultColors.greyText),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: DefaultColors.darkText),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
