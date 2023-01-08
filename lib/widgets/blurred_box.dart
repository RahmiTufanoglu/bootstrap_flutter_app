import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredBox extends StatelessWidget {
  const BlurredBox({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.borderRadius = 0.0,
    this.decoration,
    this.imageFilter,
    this.innerPadding,
    this.innerAlignment,
  });

  final Widget child;
  final double? width;
  final double? height;
  final double borderRadius;
  final Decoration? decoration;
  final ImageFilter? imageFilter;
  final EdgeInsets? innerPadding;
  final AlignmentGeometry? innerAlignment;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      child: BackdropFilter(
        filter: imageFilter ?? ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: DecoratedBox(
          decoration: decoration ?? BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: Padding(
            padding: innerPadding ?? EdgeInsets.zero,
            child: Stack(
              alignment: innerAlignment ?? Alignment.center,
              children: [
                SizedBox(width: width, height: height),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
