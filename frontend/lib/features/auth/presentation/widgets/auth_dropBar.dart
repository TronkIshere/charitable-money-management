import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class AuthDropBar extends StatelessWidget {
  final String label;
  final String? selectedValue;
  final List<String> items;
  final Function(String?) onChanged;
  final IconData icon;

  const AuthDropBar({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    this.icon = Icons.person,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPopup(context),
      child: AbsorbPointer(
        child: TextField(
          readOnly: true,
          decoration: InputDecoration(
            hintText: selectedValue ?? label,
            hintStyle: TextStyle(color: selectedValue == null ? DefaultColors.greyText : DefaultColors.greyText),
            filled: true,
            fillColor: DefaultColors.sentMessageInput,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Icon(icon, color: DefaultColors.greyText),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25), borderSide: BorderSide.none),
            suffixIcon: const Icon(Icons.arrow_drop_down, color: DefaultColors.greyText),
          ),
          style: const TextStyle(color: DefaultColors.greyText),
        ),
      ),
    );
  }

  void _showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: DefaultColors.sentMessageInput,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: items.map((value) {
              return ListTile(
                title: Text(
                  value,
                  style: const TextStyle(
                    color: DefaultColors.greyText,
                    fontSize: FontsSizes.medium,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  onChanged(value);
                  Navigator.pop(context);
                },
                trailing: selectedValue == value ? const Icon(Icons.check, color: Colors.white) : null,
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
