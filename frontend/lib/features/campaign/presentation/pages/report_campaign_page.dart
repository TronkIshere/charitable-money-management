import 'package:flutter/material.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_appBar.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_attachment.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_bottom_button.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_drop_down_bar.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_information_input.dart';
import 'package:frontend/features/campaign/presentation/widgets/report_campaign/report_campaign_name.dart';

class ReportCampaignPage extends StatefulWidget {
  const ReportCampaignPage({super.key});

  @override
  State<ReportCampaignPage> createState() => _ReportCampaignPageState();
}

class _ReportCampaignPageState extends State<ReportCampaignPage> {
  final TextEditingController _describe = TextEditingController();
  final TextEditingController _contactInformation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReportCampaignAppbar(title: "Báo cáo gian lận"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReportCampaignDropDownBar(),
              SizedBox(height: 10),
              ReportCampaignName(campaignName: "Mái ấm Hoa Hồng"),
              SizedBox(height: 20),
              ReportCampaignInformationInput(label: "Mô tả chi tiết:", hint: "Nhập mô tả chi tiết", text: _describe),
              SizedBox(height: 20),
              ReportCampaignInformationInput(
                label: "Thông tin liên hệ:",
                hint: "Nhập thông tin liên hệ",
                text: _contactInformation,
              ),
              const SizedBox(height: 20),
              ReportCampaignAttachment(),
            ],
          ),
        ),
      ),
      bottomSheet: ReportCampaignBottomButton(),
    );
  }
}
