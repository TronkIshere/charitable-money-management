import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentQuickAmountButton extends StatelessWidget {
  final String label;
  final int amount;
  final TextEditingController money;
  const PaymentQuickAmountButton({super.key, required this.label, required this.amount, required this.money});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        final current = int.tryParse(money.text) ?? 0;
        money.text = (current + amount).toString();
      },
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: BorderSide(color: DefaultColors.darkText),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
      child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }
}
