import 'package:flutter/material.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_appBar.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_button.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_input_field.dart';

enum ForgotPasswordStep { enterEmail, enterOtp, newPassword }

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  ForgotPasswordStep _step = ForgotPasswordStep.enterEmail;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  String get _title {
    switch (_step) {
      case ForgotPasswordStep.enterEmail:
        return "Quên mật khẩu";
      case ForgotPasswordStep.enterOtp:
        return "Xác thực OTP";
      case ForgotPasswordStep.newPassword:
        return "Đặt mật khẩu mới";
    }
  }

  void _nextStep() {
    setState(() {
      if (_step == ForgotPasswordStep.enterEmail) {
        _step = ForgotPasswordStep.enterOtp;
      } else if (_step == ForgotPasswordStep.enterOtp) {
        _step = ForgotPasswordStep.newPassword;
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  void _prevStep() {
    setState(() {
      if (_step == ForgotPasswordStep.newPassword) {
        _step = ForgotPasswordStep.enterOtp;
      } else if (_step == ForgotPasswordStep.enterOtp) {
        _step = ForgotPasswordStep.enterEmail;
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AuthAppbar(title: _title, onBack: _prevStep),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_step == ForgotPasswordStep.enterEmail) _buildEmailStep(),
              if (_step == ForgotPasswordStep.enterOtp) _buildOtpStep(),
              if (_step == ForgotPasswordStep.newPassword) _buildNewPasswordStep(),
              const SizedBox(height: 30),
              AuthButton(
                text: _step == ForgotPasswordStep.newPassword ? "Đặt mật khẩu" : "Tiếp tục",
                onPressed: _nextStep,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailStep() {
    return Column(
      children: [
        const Text("Nhập email để nhận mã OTP", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 20),
        AuthInputField(hint: "Email", icon: Icons.mail, controller: _emailController),
      ],
    );
  }

  Widget _buildOtpStep() {
    return Column(
      children: [
        const Text("Nhập mã OTP đã gửi về email", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 20),
        AuthInputField(hint: "Mã OTP", icon: Icons.lock_clock, controller: _otpController),
      ],
    );
  }

  Widget _buildNewPasswordStep() {
    return Column(
      children: [
        const Text("Tạo mật khẩu mới", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 20),
        AuthInputField(hint: "Mật khẩu mới", icon: Icons.lock, isPassword: true, controller: _passwordController),
        const SizedBox(height: 20),
        AuthInputField(
          hint: "Nhập lại mật khẩu",
          icon: Icons.lock_outline,
          isPassword: true,
          controller: _confirmPasswordController,
        ),
      ],
    );
  }
}
