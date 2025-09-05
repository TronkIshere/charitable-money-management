import 'package:flutter/material.dart';
import 'package:frontend/features/campaign/presentation/widgets/campaigns_searching/campaigns_searching_campaigns_item.dart';

class CampaignsSearchingCampaignsList extends StatelessWidget {
  final List<Map<String, dynamic>> campaigns;

  const CampaignsSearchingCampaignsList({super.key, required this.campaigns});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var c in campaigns)
          CampaignsSearchingCampaignsItem(
            title: c["title"] as String,
            organization: c["organization"] as String,
            daysLeft: c["daysLeft"] as int,
            raisedAmount: c["raised"] as double,
            goalAmount: c["goal"] as double,
            imageUrl: c["image"] as String,
          ),
      ],
    );
  }
}
