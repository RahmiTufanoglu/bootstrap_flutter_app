import 'package:flutter/material.dart';
import 'package:form_app/utils/constants.dart';

class UnfocusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UnfocusableAppBar({
    super.key,
    this.height,
    this.title,
  });

  final double? height;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Focus(
        descendantsAreFocusable: false,
        canRequestFocus: false,
        child: AppBar(
          title: title,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kAppBarHeight);
}
