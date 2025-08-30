import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentation/widgets/home_campaign_filter_bar.dart';
import 'package:frontend/features/home/presentation/widgets/home_campaign_item.dart';

class HomeCampaignItemList extends StatelessWidget {
  const HomeCampaignItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final campaigns = [
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeCampaignFilterBar(),
        for (var c in campaigns)
          HomeCampaignItem(
            title: c["title"] as String,
            organization: c["organization"] as String,
            daysLeft: c["daysLeft"] as int,
            raisedAmount: c["raised"] as double,
            goalAmount: c["goal"] as double,
            imageUrl: c["image"] as String,
          ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Xem tất cả",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
