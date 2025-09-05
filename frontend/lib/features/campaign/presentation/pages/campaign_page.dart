import 'package:flutter/material.dart';
import 'package:frontend/features/campaign/presentation/widgets/campaign/campaign_activities.dart';
import 'package:frontend/features/campaign/presentation/widgets/campaign/campaign_banner.dart';
import 'package:frontend/features/campaign/presentation/widgets/campaign/campaign_bottomBar.dart';
import 'package:frontend/features/campaign/presentation/widgets/campaign/campaign_description.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  final Map<String, dynamic> campaign = {
    "title": "Giúp đỡ trẻ em vùng cao",
    "organization": "Quỹ Trái Tim",
    "daysLeft": 12,
    "raised": 15000000.0,
    "goal": 30000000.0,
    "image": "https://ktktlaocai.edu.vn/wp-content/uploads/2019/10/tre-em-vung-cao-kho-khan-1.jpg",
    "categoryName": "Giáo dục",
    "description":
        "Dự án nhằm quyên góp quỹ hỗ trợ trẻ em nghèo vùng cao. Số tiền quyên góp sẽ được sử dụng để mua sách vở, quần áo ấm, dụng cụ học tập và cải thiện điều kiện sinh hoạt. Chúng tôi mong muốn mang lại cơ hội học tập tốt hơn và một cuộc sống ấm no hơn cho các em nhỏ nơi vùng cao khó khăn.",
  };

  final List<Map<String, dynamic>> charityPosts = [
    {
      "title": "Phát quà Trung Thu cho trẻ em miền núi",
      "organization": "Nhóm Từ Thiện Ánh Sáng",
      "image": "https://eaut.edu.vn/wp-content/uploads/2021/03/tt.jpg",
      "description":
          "Chương trình Trung Thu yêu thương dành tặng 200 phần quà cho trẻ em nghèo tại Hà Giang. Mỗi phần quà bao gồm bánh trung thu, đèn lồng và nhu yếu phẩm.",
      "likes": 123,
      "comments": 45,
      "shares": 20,
    },
    {
      "title": "Phát cháo miễn phí tại bệnh viện",
      "organization": "CLB Thiện Nguyện Trái Tim Hồng",
      "image": "https://m.yodycdn.com/blog/quyen-gop-quan-ao-yodyvn5.jpg",
      "description":
          "Mỗi sáng thứ 7, nhóm phát 300 suất cháo miễn phí cho bệnh nhân nghèo tại Bệnh viện Chợ Rẫy. Hoạt động duy trì suốt 3 năm nay.",
      "likes": 230,
      "comments": 78,
      "shares": 40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CampaignBanner(image: campaign["image"]),
            CampaignDescription(
              title: campaign["title"],
              description: campaign["description"],
              categoryName: campaign["categoryName"],
              daysLeft: campaign["daysLeft"],
            ),
            CampaignActivities(charityPosts: charityPosts),
          ],
        ),
      ),
      bottomNavigationBar: CampaignBottombar(raised: campaign["raised"], goal: campaign["goal"]),
    );
  }
}
