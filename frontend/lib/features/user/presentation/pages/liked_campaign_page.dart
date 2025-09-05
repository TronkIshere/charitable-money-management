import 'package:flutter/material.dart';
import 'package:frontend/features/user/presentation/widgets/liked_campaign_appBar.dart';
import 'package:frontend/features/user/presentation/widgets/liked_campaign_list.dart';
import 'package:frontend/features/user/presentation/widgets/liked_campaign_pagination_controls.dart';
import 'package:frontend/features/user/presentation/widgets/liked_campaign_search_bar.dart';

class LikedCampaignPage extends StatefulWidget {
  const LikedCampaignPage({super.key});

  @override
  State<LikedCampaignPage> createState() => _LikedCampaignPagePageState();
}

class _LikedCampaignPagePageState extends State<LikedCampaignPage> {
  final int itemsPerPage = 10;
  int currentPage = 0;

  final List<Map<String, dynamic>> campaigns = [
    {
      "title": "Giúp đỡ trẻ em vùng cao",
      "organization": "Quỹ Trái Tim",
      "daysLeft": 12,
      "raised": 15000000.0,
      "goal": 30000000.0,
      "image": "https://ktktlaocai.edu.vn/wp-content/uploads/2019/10/tre-em-vung-cao-kho-khan-1.jpg",
    },
    {
      "title": "Xây trường học mới",
      "organization": "Hội Từ Thiện ABC",
      "daysLeft": 25,
      "raised": 8000000.0,
      "goal": 20000000.0,
      "image":
          "https://thanhnien.mediacdn.vn/Uploaded/nuvuong/2022_10_30/301046179-6002995063066792-2954739104318735510-n-225.jpg",
    },
    {
      "title": "Hỗ trợ bệnh nhân ung thư",
      "organization": "Quỹ Vì Sức Khỏe Cộng Đồng",
      "daysLeft": 7,
      "raised": 45000000.0,
      "goal": 50000000.0,
      "image":
          "https://cafefcdn.com/203337114487263232/2023/9/27/1681820968imageproject10-16938836085331349178110-1695791177712-16957911778292100374465.jpg",
    },
    {
      "title": "Cung cấp nước sạch cho vùng hạn hán",
      "organization": "GreenLife",
      "daysLeft": 18,
      "raised": 12000000.0,
      "goal": 25000000.0,
      "image": "https://img.freepik.com/free-photo/people-collecting-water-africa_23-2149052060.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, campaigns.length);
    final currentCampaigns = campaigns.sublist(startIndex, endIndex);

    return Scaffold(
      appBar: const LikedCampaignAppbar(title: "Danh sách đã tim"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LikedCampaignSearchBar(),
            const SizedBox(height: 10),
            LikedCampaignList(campaigns: currentCampaigns),
            LikedCampaignPaginationControls(
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
