import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/email_field.dart';
import 'package:form_app/form_data.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  static const routeName = 'forgot_password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(
        builder: (_, ref, __) {
          final formData = ref.watch(formProvider);
          return EmailField(
            value: formData.email,
            onChanged: (email) {
              ref.read(formProvider.notifier).state = formData.copyWith(email: email);
            },
            onCleared: () {
              ref.read(formProvider.notifier).state = formData.copyWith(email: '');
            },
          );
        },
      ),
    );
  }
}
