import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class PaymentButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const PaymentButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
