import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppStartLoaderPage extends StatelessWidget {
  const AppStartLoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}
