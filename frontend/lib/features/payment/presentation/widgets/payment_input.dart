import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController money;
  const PaymentInput({super.key, required this.label, required this.hint, required this.money});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: DefaultColors.darkText),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: money,
          keyboardType: TextInputType.number,
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
