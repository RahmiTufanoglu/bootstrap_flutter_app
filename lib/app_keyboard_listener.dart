import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AppKeyboardListener extends StatefulWidget {
  const AppKeyboardListener({
    super.key,
    required this.child,
    required this.submitFocusNode,
    required this.onSubmit,
  });

  final Widget child;
  final FocusNode submitFocusNode;
  final VoidCallback onSubmit;

  @override
  State<AppKeyboardListener> createState() => _AppKeyboardListenerState();
}

class _AppKeyboardListenerState extends State<AppKeyboardListener> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      onKey: (event) {
        final isEnterPressed = event.logicalKey == LogicalKeyboardKey.enter;
        final isDownEvent = event is RawKeyDownEvent;
        if (isEnterPressed && isDownEvent) {
          FocusScope.of(context)
            ..unfocus()
            ..requestFocus(widget.submitFocusNode);
          widget.onSubmit();
        }
      },
      child: widget.child,
    );
  }
}
