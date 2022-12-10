import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/utils/text_editing_controller_helper.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = 'forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (_, ref, __) {
          final formData = ref.watch(formProvider).formData;

          _emailController.text = formData.email ?? '';
          _emailController.setToNormalPosition();

          _passwordController.text = formData.password ?? '';
          _passwordController.setToNormalPosition();

          return EmailField(
            controller: _emailController,
            onChanged: (email) {
              ref.read(formProvider.notifier).formData = formData.copyWith(email: email);
            },
            onCleared: () {
              ref.read(formProvider.notifier).formData = formData.copyWith(email: '');
            },
          );
        },
      ),
    );
  }
}
