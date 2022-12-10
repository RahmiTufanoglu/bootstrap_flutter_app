import 'package:flutter/material.dart';

class AnotherPage extends StatefulWidget {
  const AnotherPage({super.key});

  static const routeName = 'another';

  @override
  State<AnotherPage> createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
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
            child: Container(),
          );
        },
      ),
    );
  }
}
