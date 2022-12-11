import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class PageTransition extends CustomTransitionPage {
  PageTransition({super.key, required super.child})
      : super(
          transitionDuration: kIsWeb ? Duration.zero : const Duration(milliseconds: 350),
          transitionsBuilder: (_, animation, __, child) {
            /// From top to bottom slide transition
            return SlideTransition(
              position: animation.drive(
                Tween(
                  begin: kIsWeb ? Offset.zero : const Offset(0.0, -1.0),
                  end: Offset.zero,
                ).chain(
                  CurveTween(curve: Curves.easeInOutSine),
                ),
              ),
              child: child,
            );
          },
        );
}
