import 'package:flutter/material.dart';
import 'package:form_app/utils/reg_ex_helper.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onCleared,
    this.counterVisible = false,
  });

  final TextEditingController controller;
  final void Function(String password) onChanged;
  final VoidCallback onCleared;
  final bool counterVisible;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  var _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      obscureText: _obscurePassword,
      onChanged: widget.onChanged,
      validator: _onValidate,
      maxLength: 16,
      toolbarOptions: const ToolbarOptions(
        selectAll: true,
        paste: true,
      ),
      buildCounter: (_, {required currentLength, maxLength, required isFocused}) {
        if (widget.counterVisible) {
          return Text(
            '$currentLength / $maxLength',
            semanticsLabel: 'character count',
          );
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        suffixIcon: Focus(
          descendantsAreFocusable: false,
          canRequestFocus: false,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: widget.onCleared,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _onValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (!value.isValidPassword) {
      return 'Invalid password';
    }
    return null;
  }
}
