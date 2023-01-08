import 'package:flutter/material.dart';
import 'package:form_app/utils/reg_ex_helper.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onCleared,
  });

  final TextEditingController controller;
  final void Function(String email) onChanged;
  final VoidCallback onCleared;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      autocorrect: false,
      validator: _onValidate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'hello@world.com',
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        suffixIcon: Focus(
          descendantsAreFocusable: false,
          canRequestFocus: false,
          child: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: widget.onCleared,
          ),
        ),
      ),
    );
  }

  String? _onValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!value.isValidEmail) {
      return 'Invalid email';
    }
    return null;
  }
}
