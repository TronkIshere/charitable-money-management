import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class ReportCampaignName extends StatelessWidget {
  final String campaignName;
  const ReportCampaignName({super.key, required this.campaignName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Tên chiến dịch: ",
          style: TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            campaignName,
            style: TextStyle(color: DefaultColors.greyText, fontSize: 18, fontWeight: FontWeight.w600),
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
