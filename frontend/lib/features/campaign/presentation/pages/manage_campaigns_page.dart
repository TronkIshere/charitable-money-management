import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/campaign/presentation/widgets/manage_campaign/manage_campaigns_appBar.dart';
import 'package:frontend/features/campaign/presentation/widgets/manage_campaign/manage_campaigns_button.dart';
import 'package:frontend/features/campaign/presentation/widgets/manage_campaign/manage_campaigns_pagination_controls.dart';
import 'package:frontend/features/campaign/presentation/widgets/manage_campaign/manage_campaigns_search_bar.dart';
import 'package:frontend/features/campaign/presentation/widgets/manage_campaign/manage_campaigns_table.dart';

class ManageCampaignsPage extends StatefulWidget {
  const ManageCampaignsPage({super.key});

  @override
  State<ManageCampaignsPage> createState() => _ManageCampaignsPageState();
}

class _ManageCampaignsPageState extends State<ManageCampaignsPage> {
  final int itemsPerPage = 10;
  int currentPage = 0;

  final List<Map<String, dynamic>> campaigns = [
    {"title": "Giúp đỡ trẻ em vùng cao", "status": "Đang diễn ra", "raised": 15000000.0, "goal": 30000000.0},
    {"title": "Xây trường học mới", "status": "Chờ duyệt", "raised": 8000000.0, "goal": 20000000.0},
    {"title": "Hỗ trợ bệnh nhân ung thư", "status": "Hoàn thành", "raised": 45000000.0, "goal": 50000000.0},
    {
      "title": "Cung cấp nước sạch cho vùng hạn hán",
      "status": "Đang diễn ra",
      "raised": 12000000.0,
      "goal": 25000000.0,
    },
    {"title": "Tặng áo ấm mùa đông cho trẻ em", "status": "Chờ duyệt", "raised": 5000000.0, "goal": 15000000.0},
  ];

  @override
  Widget build(BuildContext context) {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, campaigns.length);
    final currentCampaigns = campaigns.sublist(startIndex, endIndex);

    return Scaffold(
      backgroundColor: DefaultColors.white,
      appBar: ManageCampaignsAppbar(title: "Quản lý chiến dịch"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ManageCampaignsSearchBar(),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ManageCampaignsButton(title: "Đăng ký chiến dịch", horizontal: 30, vertical: 14)],
            ),
            const SizedBox(height: 20),
            ManageCampaignsTable(campaigns: campaigns),
            const SizedBox(height: 20),
            ManageCampaignsPaginationControls(
              currentPage: currentPage,
              totalItems: campaigns.length,
              itemsPerPage: itemsPerPage,
              onPreviousPage: () {
                setState(() {
                  currentPage--;
                });
              },
              onNextPage: () {
                setState(() {
                  currentPage++;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
