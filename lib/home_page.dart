import 'package:flutter/material.dart';
import 'package:form_app/login_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Home'),
            const SizedBox(height: 20.0),
            TextButton(
              onPressed: () => context.push('/${LoginPage.routeName}'),
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
