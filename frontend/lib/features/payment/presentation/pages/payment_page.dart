import 'package:flutter/material.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_appBar.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_button.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_campaign_information.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_check_box.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_input.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_quick_amount_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController _money = TextEditingController();
  final TextEditingController _message = TextEditingController();
  bool _anonymous = false;

  void _onPayment() {}

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentAppbar(title: "Quyên góp"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PaymentCampaignInformation(
                image: campaign["image"],
                title: campaign["title"],
                organization: campaign["organization"],
              ),
              PaymentInput(label: "Nhập số tiền muốn quyên góp:", hint: "Nhập số tiền (VNĐ)", money: _money),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  PaymentQuickAmountButton(label: "+50k", amount: 50000, money: _money),
                  PaymentQuickAmountButton(label: "+100k", amount: 100000, money: _money),
                  PaymentQuickAmountButton(label: "+200k", amount: 200000, money: _money),
                  PaymentQuickAmountButton(label: "+500k", amount: 500000, money: _money),
                ],
              ),
              const SizedBox(height: 30),
              PaymentInput(label: "Lời nhắn (không bắt buộc):", hint: "Nhập lời nhắn", money: _message),
              const SizedBox(height: 20),
              PaymentCheckBox(
                label: "Ẩn tên khi quyên góp:",
                value: _anonymous,
                onChanged: (val) {
                  setState(() {
                    _anonymous = val ?? false;
                  });
                },
              ),
              const SizedBox(height: 20),
              PaymentButton(text: "Quyên góp", onPressed: _onPayment),
            ],
          ),
        ),
      ),
    );
  }
}
