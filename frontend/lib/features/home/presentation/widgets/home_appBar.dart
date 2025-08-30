import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const _AppbarTitle(),
      actions: const [_NotificationDropdown(), _ProfileMenu(), SizedBox(width: 8)],
    );
  }
}

class _AppbarTitle extends StatelessWidget {
  const _AppbarTitle();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hi, Trong',
          style: TextStyle(color: DefaultColors.greyText, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text('Hãy bắt đầu lan tỏa điều tốt đẹp', style: TextStyle(color: DefaultColors.darkGreen, fontSize: 16)),
      ],
    );
  }
}

class _NotificationDropdown extends StatefulWidget {
  const _NotificationDropdown();

  @override
  State<_NotificationDropdown> createState() => _NotificationDropdownState();
}

class _NotificationDropdownState extends State<_NotificationDropdown> {
  final List<Map<String, dynamic>> campaigns = [
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
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<Map<String, dynamic>>(
        customButton: Stack(
          children: [
            IconButton(iconSize: 40, icon: const Icon(Icons.notifications, color: Colors.black), onPressed: null),
            if (campaigns.any((c) => !c['read']))
              Positioned(
                right: 8,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                  constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                  child: Text(
                    '${campaigns.where((c) => !c['read']).length}',
                    style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        isExpanded: true,
        dropdownStyleData: DropdownStyleData(
          width: 350,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          offset: const Offset(-200, 10),
          maxHeight: 600,
        ),
        menuItemStyleData: const MenuItemStyleData(height: 100),
        items: campaigns.map((campaign) {
          return DropdownMenuItem<Map<String, dynamic>>(
            value: campaign,
            child: IntrinsicHeight(child: _NotificationTile(campaign: campaign)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            setState(() {
              value['read'] = true;
            });
          }
        },
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final Map<String, dynamic> campaign;

  const _NotificationTile({required this.campaign});

  @override
  Widget build(BuildContext context) {
    final bool isRead = campaign['read'] ?? false;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircleAvatar(radius: 25, backgroundImage: NetworkImage(campaign['image']))],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  campaign['title'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isRead ? Colors.grey[700] : Colors.black,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  campaign['organization'] ?? '',
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  campaign['content'] ?? '',
                  style: TextStyle(color: DefaultColors.darkText, fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  campaign['date'] ?? '',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          if (!isRead)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _ProfileMenu extends StatefulWidget {
  const _ProfileMenu();

  @override
  State<_ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<_ProfileMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        value: selectedValue,
        onChanged: (value) {
          if (value != null) {
            _MenuUtils.handleSelection(value, context);
          }
        },
        customButton: IconButton(iconSize: 40, icon: const Icon(Icons.person, color: Colors.black), onPressed: null),
        dropdownStyleData: DropdownStyleData(
          width: 250,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          offset: const Offset(0, 10),
        ),
        items: _MenuUtils.items,
      ),
    );
  }
}

class _MenuUtils {
  static List<DropdownMenuItem<String>> get items => [
    _item(Icons.account_circle, 'Tài khoản'),
    _item(Icons.work, 'Quản lý dự án'),
    _item(Icons.edit, 'Chỉnh sửa hồ sơ'),
    _item(Icons.favorite, 'Quyên góp của tôi'),
    _item(Icons.bookmark, 'Chiến dịch đã tim'),
    _item(Icons.settings, 'Cài đặt'),
    _item(Icons.exit_to_app, 'Đăng xuất', isLogout: true),
  ];

  static DropdownMenuItem<String> _item(IconData icon, String text, {bool isLogout = false}) {
    return DropdownMenuItem<String>(
      value: text,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          children: [
            Icon(icon, color: isLogout ? Colors.red : DefaultColors.darkText, size: 20),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: isLogout ? Colors.red : DefaultColors.darkText,
                fontSize: 14,
                fontWeight: isLogout ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void handleSelection(String value, BuildContext context) {
    switch (value) {
      case 'Đăng xuất':
        _showLogoutDialog(context);
        break;
      default:
        debugPrint('$value selected');
    }
  }

  static void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Đăng xuất'),
          content: const Text('Bạn có chắc chắn muốn đăng xuất?'),
          actions: [
            TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Hủy')),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Đăng xuất', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
