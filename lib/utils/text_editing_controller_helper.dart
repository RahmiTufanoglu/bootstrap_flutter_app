import 'package:flutter/cupertino.dart';

extension TextEditingControllerHelper on TextEditingController {
  void normalizeCursorPosition() {
    selection = TextSelection.fromPosition(
      TextPosition(offset: text.length),
    );
  }
}
