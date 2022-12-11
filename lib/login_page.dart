import 'dart:developer' as debug;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/forgot_password_page.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/password_field.dart';
import 'package:form_app/register_page.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
import 'package:form_app/utils/app_keyboard_listener.dart';
import 'package:form_app/utils/text_editing_controller_helper.dart';
import 'package:form_app/widgets/centered_container.dart';
import 'package:form_app/widgets/unfocusable_app_bar.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _submitFocusNode;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _submitFocusNode = FocusNode();
  }

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
      appBar: UnfocusableAppBar(
        title: Text(
          'Login',
          style: textStyle.appBarTitle,
        ),
      ),
      body: CenteredContainer(
        child: Consumer(
          builder: (context, ref, __) {
            final formData = ref.watch(formProvider).formData;

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
                        onChanged: (password) {
                          ref.read(formProvider.notifier).formData = formData.copyWith(password: password);
                        },
                        onCleared: () {
                          ref.read(formProvider.notifier).formData = formData.copyWith(password: '');
                        },
                      ),
                      const SizedBox(height: 30.0),
                      Focus(
                        descendantsAreFocusable: false,
                        canRequestFocus: false,
                        child: InkWell(
                          onTap: () => context.push('/${ForgotPasswordPage.routeName}'),
                          child: Text(
                            'Forgot password',
                            style: textStyle.primary,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Focus(
                        descendantsAreFocusable: false,
                        canRequestFocus: false,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: textStyle.primary2,
                            ),
                            const SizedBox(width: 10.0),
                            InkWell(
                              onTap: () => context.push('/${RegisterPage.routeName}'),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  'Signup',
                                  style: textStyle.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: 150.0,
                        height: 50.0,
                        child: OutlinedButton(
                          focusNode: _submitFocusNode,
                          onPressed: () async => _onSubmit(formData),
                          child: const Text('Login'),
                        ),
                      ),
                    ],
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
