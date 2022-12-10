import 'package:flutter/material.dart';

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
          const Text('Accept terms and conditions.'),
          Checkbox(
            value: widget.value,
            onChanged: (value) {
              //_accepted = value ?? false;
              widget.onChanged(value ?? false);
            },
          ),
        ],
      ),
    );
  }
}
