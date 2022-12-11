import 'package:flutter/widgets.dart';

class CenteredContainer extends StatelessWidget {
  const CenteredContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;
        return SizedBox(
          width: maxWidth,
          height: maxHeight,
          child: Center(
            child: child,
          ),
        );
      },
    );
  }
}
