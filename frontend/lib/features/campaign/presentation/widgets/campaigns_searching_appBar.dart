import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class CampaignsSearchingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMenuTap;

  const CampaignsSearchingAppbar({super.key, this.onBack, this.onSearchTap, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new, color: DefaultColors.darkText),
        onPressed: onBack ?? () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.search, color: DefaultColors.darkText),
          onPressed: onSearchTap,
        ),
        IconButton(
          iconSize: 30,
          icon: const Icon(Icons.menu, color: DefaultColors.darkText),
          onPressed: onMenuTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
