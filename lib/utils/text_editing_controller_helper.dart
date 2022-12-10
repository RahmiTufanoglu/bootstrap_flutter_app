import 'package:flutter/cupertino.dart';

extension TextEditingControllerHelper on TextEditingController {
  void setToNormalPosition() {
    selection = TextSelection.fromPosition(
      TextPosition(offset: text.length),
    );
  }
}
