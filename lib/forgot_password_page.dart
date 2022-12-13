import 'dart:developer' as debug;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/password_field.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
import 'package:form_app/utils/text_editing_controller_helper.dart';
import 'package:form_app/widgets/centered_container.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = 'forgot_password';

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _submitFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _submitFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeExt<TextStyleExtension>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot password',
          style: textStyle.appBarTitle,
        ),
      ),
      body: Consumer(
        builder: (_, ref, __) {
          final formData = ref.watch(formProvider);

          _emailController
            ..text = formData.email ?? ''
            ..normalizeCursorPosition();

          _passwordController
            ..text = formData.password ?? ''
            ..normalizeCursorPosition();

          return CenteredContainer(
            child: Form(
              key: _formKey,
              child: SizedBox(
                width: 320.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailField(
                      controller: _emailController,
                      onChanged: (email) {
                        ref.read(formProvider.notifier).formData = formData.copyWith(email: email);
                      },
                      onCleared: () {
                        ref.read(formProvider.notifier).formData = formData.copyWith(email: '');
                      },
                    ),
                    const SizedBox(height: 20.0),
                    PasswordField(
                      controller: _passwordController,
                      counterVisible: true,
                      onChanged: (password) {
                        ref.read(formProvider.notifier).formData = formData.copyWith(password: password);
                      },
                      onCleared: () {
                        ref.read(formProvider.notifier).formData = formData.copyWith(password: '');
                      },
                    ),
                    const SizedBox(height: 50.0),
                    SizedBox(
                      height: 50.0,
                      child: TextButton(
                        focusNode: _submitFocusNode,
                        onPressed: () async => _onSubmit(formData),
                        child: const Text('Reset password'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _onSubmit(FormData formData) async {
    debug.log(
      'Email: ${formData.email}, '
      'Password: ${formData.password}, '
      'Term accepted: ${formData.termsAccepted.toString()}',
    );
    final formValid = _formKey.currentState?.validate() ?? false;
    final accepted = formData.termsAccepted ?? false;
    if (formValid && accepted) {
      _showSnackBar('Processing Data');
    } else {
      _showSnackBar('Invalid Data');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 800),
        onVisible: () {},
      ),
    );
  }
}
