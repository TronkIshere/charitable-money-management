import 'package:flutter/material.dart';

class ManageCampaignsButton extends StatelessWidget {
  final String title;
  final double horizontal;
  final double vertical;
  const ManageCampaignsButton({super.key, required this.title, required this.horizontal, required this.vertical});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      ),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}
