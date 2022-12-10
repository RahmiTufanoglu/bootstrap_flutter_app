import 'package:flutter/material.dart';
import 'package:form_app/error_page.dart';
import 'package:form_app/routes/router.dart';
import 'package:form_app/scroll_behaviour.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My App',
      routerConfig: appRouter,
      themeMode: ThemeMode.system,
      theme: ThemeData(primarySwatch: Colors.blue),
      darkTheme: ThemeData(primarySwatch: Colors.blue),
      scrollBehavior: AppScrollBehavior(),
      builder: (context, child) {
        if (child != null) {
          return child;
        }
        return const ErrorPage(message: 'No child widget');
      },
    );
  }
}
