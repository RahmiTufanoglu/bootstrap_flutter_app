import 'package:flutter/material.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';

class TermsCheckboxRow extends StatefulWidget {
  const TermsCheckboxRow({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final Function(bool termsAccepted) onChanged;

  @override
  State<TermsCheckboxRow> createState() => _TermsCheckboxRowState();
}

class _TermsCheckboxRowState extends State<TermsCheckboxRow> {
  @override
  Widget build(BuildContext context) {
    return Focus(
      descendantsAreFocusable: false,
      canRequestFocus: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Accept terms and conditions.',
            style: context.themeExt<TextStyleExtension>().primary,
          ),
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            value: widget.value,
            onChanged: (value) => widget.onChanged(value ?? false),
          ),
        ],
      ),
    );
  }
}
