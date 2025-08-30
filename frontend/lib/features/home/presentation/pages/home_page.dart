import 'package:flutter/material.dart';
import 'package:frontend/features/home/presentation/widgets/home_appBar.dart';
import 'package:frontend/features/home/presentation/widgets/home_campaign_item_list.dart';
import 'package:frontend/features/home/presentation/widgets/home_category_list.dart';
import 'package:frontend/features/home/presentation/widgets/home_divider_line.dart';
import 'package:frontend/features/home/presentation/widgets/home_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeSearchBar(),
              const SizedBox(height: 20),
              HomeCategoryList(),
              const SizedBox(height: 20),
              HomeDividerLine(),
              HomeCampaignItemList(),
            ],
          ),
        ),
      ),
    );
  }
}
