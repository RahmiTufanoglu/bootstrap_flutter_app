import 'package:flutter/material.dart';

extension ThemeHelper on BuildContext {
  T themeExt<T>() => Theme.of(this).extension<T>()!;
}
