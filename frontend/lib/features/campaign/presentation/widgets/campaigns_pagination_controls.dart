import 'package:flutter/material.dart';

class CampaignsPaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalItems;
  final int itemsPerPage;
  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  const CampaignsPaginationControls({
    super.key,
    required this.currentPage,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPreviousPage,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasPrevious = currentPage > 0;
    final bool hasNext = (currentPage + 1) * itemsPerPage < totalItems;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: hasPrevious ? onPreviousPage : null, child: const Text("Trang trước")),
          const SizedBox(width: 20),
          ElevatedButton(onPressed: hasNext ? onNextPage : null, child: const Text("Trang sau")),
          const SizedBox(height: 20),
          CampaignsPaginationControls(
            currentPage: currentPage,
            totalItems: totalItems,
            itemsPerPage: itemsPerPage,
            onPreviousPage: onPreviousPage,
            onNextPage: onNextPage,
          ),
        ],
      ),
    );
  }
}
