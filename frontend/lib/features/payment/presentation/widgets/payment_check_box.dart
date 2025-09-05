import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentCheckBox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const PaymentCheckBox({super.key, required this.label, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: DefaultColors.darkText),
        ),
        const SizedBox(width: 5),
        Checkbox(value: value, onChanged: onChanged),
      ],
    );
  }
}
