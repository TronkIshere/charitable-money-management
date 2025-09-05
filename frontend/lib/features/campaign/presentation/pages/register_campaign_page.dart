import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/campaign/presentation/widgets/register_campaign/register_campaign_appBar.dart';
import 'package:frontend/features/campaign/presentation/widgets/register_campaign/register_campaign_attachment.dart';
import 'package:frontend/features/campaign/presentation/widgets/register_campaign/register_campaign_input.dart';

class RegisterCampaignPage extends StatefulWidget {
  const RegisterCampaignPage({super.key});

  @override
  State<RegisterCampaignPage> createState() => _RegisterCampaignPageState();
}

class _RegisterCampaignPageState extends State<RegisterCampaignPage> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _goal = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _shortSummary = TextEditingController();
  final TextEditingController _organizationName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegisterCampaignAppbar(title: "Đăng ký chiến dịch"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RegisterCampaignInput(label: "Tên chiến dịch", hint: "Nhập tên chiến dịch", text: _title),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Mục tiêu số tiền", hint: "Nhập số tiền mục tiêu", text: _goal),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Thời gian bắt đầu", hint: "Nhập ngày bắt đầu", text: _startDate),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Danh mục chiến dịch", hint: "Nhập danh mục", text: _category),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Mô tả chiến dịch", hint: "Nhập mô tả chi tiết", text: _description),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Tóm tắt ngắn", hint: "Nhập tóm tắt", text: _shortSummary),
            const SizedBox(height: 20),
            RegisterCampaignAttachment(label: "Đính kèm file chứng minh:"),
            const SizedBox(height: 20),
            RegisterCampaignInput(
              label: "Tên tổ chức/ người tổ chức",
              hint: "Nhập tên tổ chức hoặc cá nhân",
              text: _organizationName,
            ),
            const SizedBox(height: 20),
            RegisterCampaignAttachment(label: "Giấy tờ xác minh (Upload):"),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "Email", hint: "Nhập email", text: _email),
            const SizedBox(height: 20),
            RegisterCampaignInput(label: "SĐT", hint: "Nhập số điện thoại", text: _phone),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DefaultColors.buttonColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Đã gửi yêu cầu đăng ký chiến dịch")));
                },
                child: const Text("Gửi", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
