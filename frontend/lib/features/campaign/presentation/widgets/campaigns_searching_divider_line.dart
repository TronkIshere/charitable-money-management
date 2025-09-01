import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class CampaignsSearchingDividerLine extends StatelessWidget {
  const CampaignsSearchingDividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, thickness: 1, color: DefaultColors.primaryGreen);
  }
}
