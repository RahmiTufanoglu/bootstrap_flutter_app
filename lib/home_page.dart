import 'package:flutter/material.dart';
import 'package:form_app/login_page.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
import 'package:form_app/widgets/centered_container.dart';
import 'package:form_app/widgets/unfocusable_app_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UnfocusableAppBar(
        title: Text(
          'EmQji',
          style: context.themeExt<TextStyleExtension>().appBarTitle,
        ),
      ),
      body: CenteredContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.push('/${LoginPage.routeName}'),
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
