import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class DateInputField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;
  final IconData icon;

  const DateInputField({
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
      child: Container(
        decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Icon(icon, color: DefaultColors.greyText),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                selectedDate == null ? label : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                style: TextStyle(color: selectedDate == null ? DefaultColors.greyText : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
