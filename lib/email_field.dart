import 'package:flutter/material.dart';
import 'package:form_app/utils/reg_ex_helper.dart';

class EmailField extends StatefulWidget {
  const EmailField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onCleared,
  });

  final void Function(String email) onChanged;
  final VoidCallback onCleared;
  final String? value;

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.value ?? '';
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: widget.onChanged,
      validator: _onValidate,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        suffixIcon: Focus(
          descendantsAreFocusable: false,
          canRequestFocus: false,
          child: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _emailController.clear();
              widget.onCleared();
            },
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
