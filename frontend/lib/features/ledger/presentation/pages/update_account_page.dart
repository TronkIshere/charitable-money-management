import 'package:flutter/material.dart';
import 'package:frontend/features/ledger/presentation/widgets/update_account_appBar.dart';
import 'package:frontend/features/ledger/presentation/widgets/update_account_attachment.dart';
import 'package:frontend/features/ledger/presentation/widgets/update_account_bottom_button.dart';
import 'package:frontend/features/ledger/presentation/widgets/update_account_input.dart';

class UpdateAccountPage extends StatefulWidget {
  const UpdateAccountPage({super.key});

  @override
  State<UpdateAccountPage> createState() => _UpdateAccountPageState();
}

class _UpdateAccountPageState extends State<UpdateAccountPage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _organizeName = TextEditingController();
  final TextEditingController _organizeAddress = TextEditingController();
  final TextEditingController _reason = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpdateAccountAppbar(title: "Yêu cầu nâng cấp tài khoản"),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UpdateAccountInput(label: "Họ và tên:", hint: "Nhập họ và tên", text: _name),
                const SizedBox(height: 20),
                UpdateAccountInput(label: "Số điện thoại:", hint: "Nhập số điện thoại", text: _phoneNumber),
                const SizedBox(height: 20),
                UpdateAccountInput(label: "Email:", hint: "Nhập email", text: _email),
                const SizedBox(height: 20),
                UpdateAccountInput(label: "Tên tổ chức:", hint: "Nhập tên tổ chức", text: _organizeName),
                const SizedBox(height: 20),
                UpdateAccountInput(label: "Địa chỉ tổ chức:", hint: "Nhập địa chỉ tổ chức", text: _organizeAddress),
                const SizedBox(height: 20),
                UpdateAccountInput(label: "Lý do nâng cấp:", hint: "Nhập lý do", text: _reason),
                const SizedBox(height: 20),
                UpdateAccountAttachment(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: UpdateAccountBottomButton(),
    );
  }
}
