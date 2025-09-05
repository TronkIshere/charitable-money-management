import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class ManageCampaignsSearchBar extends StatefulWidget {
  const ManageCampaignsSearchBar({super.key});

  @override
  State<ManageCampaignsSearchBar> createState() => _ManageCampaignsSearchBarState();
}

class _ManageCampaignsSearchBarState extends State<ManageCampaignsSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: DefaultColors.sentMessageInput,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))],
            ),
            child: const TextField(
              autofocus: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
                hintText: "Tìm kiếm...",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                fillColor: DefaultColors.sentMessageInput,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _handleCancel() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }
}
