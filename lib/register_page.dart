import 'dart:developer' as debug;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/password_field.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
import 'package:form_app/utils/app_keyboard_listener.dart';
import 'package:form_app/utils/text_editing_controller_helper.dart';
import 'package:form_app/widgets/centered_container.dart';
import 'package:form_app/widgets/terms_row.dart';
import 'package:form_app/widgets/unfocusable_app_bar.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static const routeName = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mainFocusNode = FocusNode();
  final _submitFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _mainFocusNode.dispose();
    _submitFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = context.themeExt<TextStyleExtension>();

    return Scaffold(
      appBar: UnfocusableAppBar(
        title: Text(
          'Register',
          style: textStyle.appBarTitle,
        ),
      ),
      body: CenteredContainer(
        child: Consumer(
          builder: (context, ref, __) {
            final formData = ref.watch(formProvider);

            _emailController
              ..text = formData.email ?? ''
              ..normalizeCursorPosition();

            _passwordController
              ..text = formData.password ?? ''
              ..normalizeCursorPosition();

            return AppKeyboardListener(
              submitFocusNode: _submitFocusNode,
              onSubmit: () async => _onSubmit(formData),
              child: Form(
                key: _formKey,
                child: Center(
                  child: SizedBox(
                    width: 320.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmailField(
                          controller: _emailController,
                          onChanged: (email) {
                            ref.watch(formProvider.notifier).formData = formData.copyWith(email: email);
                          },
                          onCleared: () {
                            ref.watch(formProvider.notifier).formData = formData.copyWith(email: '');
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
                        const SizedBox(height: 20.0),
                        TermsCheckboxRow(
                          value: formData.termsAccepted ?? false,
                          onChanged: (termsAccepted) {
                            ref.read(formProvider.notifier).formData = formData.copyWith(termsAccepted: termsAccepted);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          height: 50.0,
                          child: TextButton(
                            focusNode: _submitFocusNode,
                            onPressed: () async => _onSubmit(formData),
                            child: const Text('Register'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
