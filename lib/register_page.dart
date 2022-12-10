import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/app_keyboard_listener.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/home_page.dart';
import 'package:form_app/password_field.dart';
import 'package:form_app/terms_row.dart';
import 'package:form_app/utils/text_editing_controller_helper.dart';
import 'package:go_router/go_router.dart';

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

  late final FocusNode _mainFocusNode;
  late final FocusNode _submitFocusNode;

  @override
  void initState() {
    super.initState();
    _mainFocusNode = FocusNode();
    _submitFocusNode = FocusNode();
  }

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
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (_, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;
          return SizedBox(
            width: maxWidth,
            height: maxHeight,
            child: Consumer(
              builder: (context, ref, __) {
                final formData = ref.watch(formProvider).formData;

                _emailController.text = formData.email ?? '';
                _emailController.setToNormalPosition();

                _passwordController.text = formData.password ?? '';
                _passwordController.setToNormalPosition();

                return AppKeyboardListener(
                  submitFocusNode: _submitFocusNode,
                  onSubmit: () => _onSubmit(formData),
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
                                ref.read(formProvider.notifier).formData =
                                    formData.copyWith(termsAccepted: termsAccepted);
                              },
                            ),
                            const SizedBox(height: 20.0),
                            SizedBox(
                              width: 150.0,
                              height: 50.0,
                              child: OutlinedButton(
                                focusNode: _submitFocusNode,
                                onPressed: () => _onSubmit(formData),
                                child: const Text('Register'),
                              ),
                            ),
                            // remove
                            const SizedBox(height: 15.0),
                            SizedBox(
                              width: 150.0,
                              height: 50.0,
                              child: OutlinedButton(
                                onPressed: () {
                                  context.push('/${HomePage.routeName}');
                                },
                                child: const Text('Go to home'),
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
          );
        },
      ),
    );
  }

  Future<void> _onSubmit(FormData formData) async {
    // ignore: avoid_print
    print(
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
