import 'package:flutter/material.dart';
import 'package:form_app/utils/reg_ex_helper.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onCleared,
    this.counterVisible = false,
  });

  final void Function(String password) onChanged;
  final VoidCallback onCleared;
  final bool counterVisible;
  final String? value;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _passwordController = TextEditingController();

  var _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _passwordController.text = widget.value ?? '';
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
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
                onPressed: () {
                  _passwordController.clear();
                  widget.onCleared();
                },
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
