import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CampaignBottombar extends StatelessWidget {
  final double raised;
  final double goal;
  const CampaignBottombar({super.key, required this.raised, required this.goal});

  @override
  Widget build(BuildContext context) {
    final double raisedAmount = raised;
    final double goalAmount = goal;
    final double progress = (raisedAmount / goalAmount).clamp(0.0, 1.0);

    return SizedBox(
      height: 130,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, offset: const Offset(0, -2))],
        ),
        child: Row(
          children: [
            Flexible(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Mục tiêu từ thiện", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  Text(
                    "${_formatCurrency(raisedAmount)} / ${_formatCurrency(goalAmount)} VNĐ",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  _buildProgressBar(progress),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Quyên góp", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatCurrency(double amount) {
    final formatter = NumberFormat('#,###', 'vi_VN');
    return formatter.format(amount);
  }

  Widget _buildProgressBar(double progress) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Stack(
        children: [
          Container(height: 12, decoration: BoxDecoration(color: Colors.grey[300])),
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 12,
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
