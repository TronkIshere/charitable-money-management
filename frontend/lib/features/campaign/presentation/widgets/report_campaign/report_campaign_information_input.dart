import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class ReportCampaignInformationInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController text;
  const ReportCampaignInformationInput({super.key, required this.label, required this.hint, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: DefaultColors.darkText, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: text,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: DefaultColors.sentMessageInput,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}
