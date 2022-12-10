import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/forgot_password_page.dart';
import 'package:form_app/form_data.dart';
import 'package:form_app/password_field.dart';
import 'package:form_app/register_page.dart';
import 'package:go_router/go_router.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  static const routeName = 'another';

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  final _formKey = GlobalKey<FormState>();

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
                return RawKeyboardListener(
                  focusNode: _mainFocusNode,
                  onKey: (event) {
                    final isEnterPressed = event.logicalKey == LogicalKeyboardKey.enter;
                    final isDownEvent = event is RawKeyDownEvent;
                    if (isEnterPressed && isDownEvent) {
                      FocusScope.of(context)
                        ..unfocus()
                        ..requestFocus(_submitFocusNode);
                      _onSubmit(formData);
                    }
                  },
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: SizedBox(
                        width: 320.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${formData.email}'),
                            EmailField(
                              value: formData.email,
                              onChanged: (email) {
                                ref.watch(formProvider.notifier).formData = formData.copyWith(email: email);
                              },
                              onCleared: () {
                                ref.watch(formProvider.notifier).formData = formData.copyWith(email: '');
                              },
                            ),
                            const SizedBox(height: 20.0),
                            PasswordField(
                              value: formData.password ?? '',
                              onChanged: (password) {
                                ref.read(formProvider.notifier).formData = formData.copyWith(password: password);
                              },
                              onCleared: () {
                                ref.read(formProvider.notifier).formData = formData.copyWith(password: '');
                              },
                            ),
                            const SizedBox(height: 20.0),
                            Focus(
                              descendantsAreFocusable: false,
                              canRequestFocus: false,
                              child: InkWell(
                                onTap: () => context.push('/${ForgotPasswordPage.routeName}'),
                                child: const Text('Forgot password'),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Focus(
                              descendantsAreFocusable: false,
                              canRequestFocus: false,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Don\'t have an account?'),
                                  const SizedBox(width: 10.0),
                                  InkWell(
                                    onTap: () => context.push('/${RegisterPage.routeName}'),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('Signup'),
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
                                onPressed: () => _onSubmit(formData),
                                child: const Text('Login'),
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
