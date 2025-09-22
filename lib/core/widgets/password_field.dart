import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({super.key, this.onSaved});

  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: widget.onSaved,
      obscureText: obscureText,
      hintText: 'كلمة المرور',
      keyboardType: TextInputType.name,
      icon: IconButton(
        onPressed: () {
          obscureText = !obscureText;
          setState(() {});
        },
        icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
      ),
    );
  }
}
