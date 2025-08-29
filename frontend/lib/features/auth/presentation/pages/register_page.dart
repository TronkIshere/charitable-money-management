import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_event.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_state.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_appBar.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_button.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_date_input_field.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_dropBar.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:frontend/features/auth/presentation/widgets/avatar_picker.dart';
import 'package:frontend/features/auth/presentation/widgets/login_prompt.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  DateTime? _selectedDate;
  String? _selectedGender;
  File? _selectedImage;

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _onRegister() {
    BlocProvider.of<AuthBloc>(context).add(
      RegisterEvent(
        username: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phoneNumber: _phoneNumberController.text,
        address: _addressController.text,
        date: _selectedDate,
        gender: _selectedGender,
        avatar: _selectedImage,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppbar(title: "Đăng ký tài khoản"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AvatarPicker(
                onImageSelected: (file) {
                  _selectedImage = file;
                },
              ),
              const SizedBox(height: 20),
              AuthInputField(hint: 'Họ và tên', icon: Icons.person, controller: _usernameController),
              const SizedBox(height: 20),
              AuthInputField(hint: 'Email', icon: Icons.mail, controller: _emailController),
              const SizedBox(height: 20),
              AuthInputField(hint: 'Mật khẩu', icon: Icons.lock, controller: _passwordController, isPassword: true),
              const SizedBox(height: 20),
              AuthDateInputField(
                label: "Chọn ngày sinh",
                selectedDate: _selectedDate,
                onDateSelected: (date) {
                  setState(() => _selectedDate = date);
                },
              ),
              const SizedBox(height: 20),
              AuthDropBar(
                label: "Chọn giới tính",
                selectedValue: _selectedGender,
                items: ["Nam", "Nữ", "lesbian hunter", "Khác"],
                onChanged: (value) {
                  setState(() {
                    _selectedGender = value;
                  });
                },
              ),
              const SizedBox(height: 20),
              AuthInputField(hint: "Số điện thoại", icon: Icons.phone, controller: _phoneNumberController),
              const SizedBox(height: 20),
              AuthInputField(hint: "Địa chỉ", icon: Icons.home, controller: _addressController),
              const SizedBox(height: 20),
              _buildLoginLine(),
              const SizedBox(height: 30),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) =>
                    state is AuthLoading ? Center(child: CircularProgressIndicator()) : _buildAuthButton(),
                listener: (context, state) {
                  if (state is AuthSuccess) Navigator.pushNamed(context, '/login');
                  if (state is AuthFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LoginPrompt(
          title: "Đã có tài khoản?",
          subtitle: " Đăng nhập",
          onTap: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
      ],
    );
  }

  Widget _buildAuthButton() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [AuthButton(text: 'Đăng ký', onPressed: _onRegister)],
        ),
      ),
    );
  }
}
