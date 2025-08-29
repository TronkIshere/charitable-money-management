import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:frontend/features/auth/presentation/bloc/login_prompt.dart';
import 'package:frontend/features/auth/presentation/bloc/register_page.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_button.dart';
import 'package:frontend/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:frontend/features/auth/presentation/widgets/login_prompt.dart';
import 'package:frontend/features/auth/presentation/widgets/logo.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    BlocProvider.of<AuthBloc>(
      context,
    ).add(LoginEvent(email: _emailController.text, password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Logo(size: 140),
              SizedBox(height: 60),
              AuthInputField(hint: 'Email', icon: Icons.mail, controller: _emailController),
              SizedBox(height: 20),
              AuthInputField(hint: 'Mật khẩu', icon: Icons.lock, controller: _passwordController, isPassword: true),
              SizedBox(height: 20),
              _buildForgetPasswordLine(),
              SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return _buildAuthButton();
                  }
                },
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamedAndRemoveUntil(context, '/conversationPage', (route) => false);
                  }
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

  Widget _buildAuthButton() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AuthButton(text: 'Đăng nhập', onPressed: _onLogin),
            const SizedBox(height: 20),
            AuthButton(
              text: 'Đăng ký',
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetPasswordLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        LoginPrompt(
          title: "",
          subtitle: "Quên mật khẩu?",
          onTap: () {
            Navigator.pushNamed(context, '/forgetPassword');
          },
        ),
      ],
    );
  }
}
