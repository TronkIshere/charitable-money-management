import 'package:flutter/material.dart';
import 'package:frontend/features/user/presentation/widgets/notifications_appBar.dart';
import 'package:frontend/features/user/presentation/widgets/notifications_list.dart';
import 'package:frontend/features/user/presentation/widgets/pagination_controls.dart';

class NotificationsListPage extends StatefulWidget {
  const NotificationsListPage({super.key});

  @override
  State<NotificationsListPage> createState() => _NotificationsListPageState();
}

class _NotificationsListPageState extends State<NotificationsListPage> {
  final int itemsPerPage = 10;
  int currentPage = 0;

  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Giúp đỡ trẻ em vùng cao",
      "organization": "Quỹ Trái Tim",
      "date": "30/08/2025",
      "read": false,
      "image": "https://ktktlaocai.edu.vn/wp-content/uploads/2019/10/tre-em-vung-cao-kho-khan-1.jpg",
      "content": "Chúng tôi đang kêu gọi ủng hộ cho trẻ em vùng cao có điều kiện học tập và sinh hoạt tốt hơn.",
    },
    {
      "title": "Xây trường học mới",
      "organization": "Hội Từ Thiện ABC",
      "date": "25/08/2025",
      "read": true,
      "image":
          "https://thanhnien.mediacdn.vn/Uploaded/nuvuong/2022_10_30/301046179-6002995063066792-2954739104318735510-n-225.jpg",
      "content": "Dự án xây dựng trường học mới cho trẻ em miền núi, cần sự chung tay của cộng đồng.",
    },
    {
      "title": "Hỗ trợ bệnh nhân ung thư",
      "organization": "Quỹ Vì Sức Khỏe Cộng Đồng",
      "date": "20/08/2025",
      "read": false,
      "image":
          "https://cafefcdn.com/203337114487263232/2023/9/27/1681820968imageproject10-16938836085331349178110-1695791177712-16957911778292100374465.jpg",
      "content": "Chương trình hỗ trợ tài chính, thuốc men và chăm sóc tinh thần cho bệnh nhân ung thư.",
    },
    {
      "title": "Ủng hộ đồng bào miền Trung",
      "organization": "Hội Thiện Nguyện XYZ",
      "date": "18/08/2025",
      "read": false,
      "image":
          "https://baotainguyenmoitruong.vn/file/e78380d8d20a4e4ca77d8a1f5d27e93e/092023/bao-lu_20230905092612.jpg",
      "content": "Đợt bão vừa qua đã ảnh hưởng nghiêm trọng, cần sự hỗ trợ lương thực và quần áo.",
    },
    {
      "title": "Hiến máu nhân đạo",
      "organization": "Bệnh viện Trung Ương",
      "date": "15/08/2025",
      "read": true,
      "image": "https://vtv1.mediacdn.vn/thumb_w/650/2019/7/19/hien-mau-15635269970681570374809.jpg",
      "content": "Sự kiện hiến máu nhân đạo vào ngày 20/8, mời mọi người đăng ký.",
    },
    {
      "title": "Quyên góp sách giáo khoa",
      "organization": "Nhà xuất bản Giáo dục",
      "date": "10/08/2025",
      "read": false,
      "image": "https://file1.dangcongsan.vn/data/0/images/2022/01/21/upload_1/sgk2.jpg",
      "content": "Kêu gọi quyên góp sách giáo khoa cũ cho học sinh vùng sâu vùng xa.",
    },
    {
      "title": "Xây cầu nông thôn",
      "organization": "Nhóm Thiện Nguyện 123",
      "date": "05/08/2025",
      "read": false,
      "image": "https://photo-cms-baophapluat.zadn.vn/700x400/Uploaded/2025/xqjvjv/2020_11_05/cau-1-4084.jpg",
      "content": "Dự án xây cầu giúp học sinh vùng sâu đi lại thuận tiện hơn.",
    },
    {
      "title": "Tặng quà trung thu",
      "organization": "Quỹ Trái Tim",
      "date": "02/08/2025",
      "read": true,
      "image": "https://media-cdn-v2.laodong.vn/storage/newsportal/2023/9/27/1234567/Trung-Thu.jpg",
      "content": "Chương trình tặng quà trung thu cho trẻ em nghèo.",
    },
    {
      "title": "Chăm sóc người già neo đơn",
      "organization": "Cộng đồng sẻ chia",
      "date": "28/07/2025",
      "read": false,
      "image": "https://giadinh.mediacdn.vn/thumb_w/640/2020/6/20/photo-1-15926219642101582894629.jpg",
      "content": "Hỗ trợ chăm sóc người cao tuổi neo đơn.",
    },
    {
      "title": "Trồng cây xanh bảo vệ môi trường",
      "organization": "GreenEarth VN",
      "date": "20/07/2025",
      "read": true,
      "image": "https://media.vov.vn/sites/default/files/styles/large/public/2023-03/2052-trong-cay.jpg",
      "content": "Chiến dịch trồng cây xanh trên khắp cả nước.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final startIndex = currentPage * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage).clamp(0, notifications.length);
    final currentNotifications = notifications.sublist(startIndex, endIndex);

    return Scaffold(
      appBar: const NotificationsAppbar(title: 'Danh sách thông báo'),
      body: Column(
        children: [
          NotificationsList(notifications: currentNotifications),
          PaginationControls(
            currentPage: currentPage,
            totalItems: notifications.length,
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
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
