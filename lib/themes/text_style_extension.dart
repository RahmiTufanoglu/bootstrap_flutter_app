import 'package:flutter/material.dart';

class TextStyleExtension extends ThemeExtension<TextStyleExtension> {
  const TextStyleExtension({
    required this.primary,
    required this.primary2,
    required this.appBarTitle,
  });

  final TextStyle primary;
  final TextStyle primary2;
  final TextStyle appBarTitle;

  @override
  TextStyleExtension copyWith({
    TextStyle? primary,
    TextStyle? primary2,
    TextStyle? appBarTitle,
  }) {
    return TextStyleExtension(
      primary: primary ?? this.primary,
      primary2: primary2 ?? this.primary2,
      appBarTitle: appBarTitle ?? this.appBarTitle,
    );
  }

  @override
  TextStyleExtension lerp(ThemeExtension<TextStyleExtension>? other, double t) {
    return this;
  }

  @override
  String toString() {
    return 'AppBoxShadows{primary: $primary}';
  }
}

TextStyleExtension get textStyleExtensionLight {
  return const TextStyleExtension(
    primary: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 14.0,
      shadows: [
        Shadow(
          color: Colors.green,
          blurRadius: 20.0,
          offset: Offset(0.0, 2.5),
        ),
      ],
    ),
    primary2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
    ),
    appBarTitle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 24.0,
      letterSpacing: 0.0,
      //shadows: [
      //  Shadow(
      //    color: Colors.green,
      //    blurRadius: 20.0,
      //    offset: Offset(0.0, 2.5),
      //  ),
      //],
    ),
  );
}

TextStyleExtension get textStyleExtensionDark {
  return const TextStyleExtension(
    primary: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 12.0,
      shadows: [
        Shadow(
          color: Colors.green,
          blurRadius: 10.0,
          offset: Offset(0.0, 2.5),
        ),
      ],
    ),
    primary2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      fontSize: 14.0,
    ),
    appBarTitle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w800,
      fontSize: 24.0,
      letterSpacing: 0.0,
      shadows: [
        Shadow(
          color: Colors.green,
          blurRadius: 20.0,
          offset: Offset(0.0, 2.5),
        ),
      ],
    ),
  );
}
