import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class AuthDateInputField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final IconData icon;

  const AuthDateInputField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
    this.icon = Icons.calendar_month,
  });

  Future<void> _pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _pickDate(context),
      child: AbsorbPointer(
        child: TextField(
          decoration: InputDecoration(
            hintText: selectedDate == null
                ? label
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
            hintStyle: TextStyle(color: selectedDate == null ? DefaultColors.greyText : DefaultColors.greyText),
            filled: true,
            fillColor: DefaultColors.sentMessageInput,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Icon(icon, color: DefaultColors.greyText),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
