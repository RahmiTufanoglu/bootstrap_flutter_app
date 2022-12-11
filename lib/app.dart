import 'package:flutter/material.dart';
import 'package:form_app/error_page.dart';
import 'package:form_app/routes/router.dart';
import 'package:form_app/themes/dark_theme.dart';
import 'package:form_app/themes/light_theme.dart';
import 'package:form_app/utils/scroll_behaviour.dart';

class App extends StatelessWidget {
  const App({super.key});

  static const appTitle = 'EmQji';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appTitle,
      routerConfig: appRouter,
      //themeMode: ThemeMode.system,
      themeMode: ThemeMode.light,
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      scrollBehavior: AppScrollBehavior(),
      builder: (_, child) {
        if (child != null) {
          return child;
        }
        return const ErrorPage(message: 'No child widget');
      },
    );
  }
}
