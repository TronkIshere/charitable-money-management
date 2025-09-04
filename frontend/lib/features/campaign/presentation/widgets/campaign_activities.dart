import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';

class CampaignActivities extends StatelessWidget {
  final List<Map<String, dynamic>> charityPosts;
  const CampaignActivities({super.key, required this.charityPosts});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tình trạng dự án",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: DefaultColors.darkText),
          ),
          ListView.builder(
            itemCount: charityPosts.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return _buildCharityPost(charityPosts[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCharityPost(Map<String, dynamic> post) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(post["title"], style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text(post["organization"]),
            leading: const CircleAvatar(
              backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/3135/3135715.png"),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(post["image"], fit: BoxFit.cover, height: 200, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(post["description"], style: const TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.favorite_border, "${post["likes"]}"),
                Container(width: 1, height: 40, color: DefaultColors.primaryGreen),
                _buildActionButton(Icons.comment_outlined, "${post["comments"]}"),
                Container(width: 1, height: 40, color: DefaultColors.primaryGreen),
                _buildActionButton(Icons.share_outlined, "${post["shares"]}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String text) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[700], size: 35),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
