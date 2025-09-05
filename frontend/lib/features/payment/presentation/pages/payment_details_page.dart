import 'package:flutter/material.dart';
import 'package:frontend/core/theme/theme.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_appBar.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_details_button_row.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_details_transaction_campaign_info.dart';
import 'package:frontend/features/payment/presentation/widgets/payment_details_transaction_item.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({super.key});

  @override
  State<PaymentDetailsPage> createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  final Map<String, dynamic> transaction = {
    "transactionId": "#TXN20250822",
    "date": "22/08/2025 - 14:30",
    "amount": 500000,
    "method": "MoMo Wallet",
    "status": "Thành công",
    "campaignTitle": "Giúp đỡ trẻ em vùng cao",
    "campaignImage": "https://ktktlaocai.edu.vn/wp-content/uploads/2019/10/tre-em-vung-cao-kho-khan-1.jpg",
    "campaignDescription":
        "Dự án nhằm quyên góp quỹ hỗ trợ trẻ em nghèo vùng cao. Số tiền quyên góp sẽ được sử dụng để mua sách vở, quần áo ấm, dụng cụ học tập và cải thiện điều kiện sinh hoạt. Chúng tôi mong muốn mang lại cơ hội học tập tốt hơn và một cuộc sống ấm no hơn cho các em nhỏ nơi vùng cao khó khăn.",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PaymentAppbar(title: "Chi Tiết quyên góp"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentDetailsTransactionItem(label: "Mã giao dịch:", value: transaction["transactionId"]),
            const SizedBox(height: 12),
            PaymentDetailsTransactionItem(label: "Ngày:", value: transaction["date"]),
            const SizedBox(height: 12),
            PaymentDetailsTransactionItem(label: "Số tiền:", value: "${transaction["amount"].toString()}₫"),
            const SizedBox(height: 12),
            PaymentDetailsTransactionItem(label: "Phương thức:", value: transaction["method"]),
            const SizedBox(height: 12),
            PaymentDetailsTransactionItem(
              label: "Trạng thái:",
              value: transaction["status"],
              valueColor: transaction["status"] == "Thành công" ? DefaultColors.primaryGreen : DefaultColors.danger,
            ),
            const SizedBox(height: 30),
            PaymentDetailsTransactionCampaignInfo(
              campaignTitle: transaction["title"],
              campaignImage: transaction["campaignImage"],
              campaignDescription: transaction["campaignDescription"],
            ),
            const SizedBox(height: 30),
            PaymentDetailsButtonRow(),
          ],
        ),
      ),
    );
  }
}
