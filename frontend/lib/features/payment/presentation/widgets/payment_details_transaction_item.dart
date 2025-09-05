import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentDetailsTransactionItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  const PaymentDetailsTransactionItem({super.key, required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, color: DefaultColors.greyText, fontSize: 18),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontWeight: FontWeight.w600, color: valueColor ?? DefaultColors.darkText, fontSize: 18),
          ),
        ),
      ],
    );
  }
}
