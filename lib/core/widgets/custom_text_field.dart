import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.icon,
  });
  final String hintText;
  final TextInputType keyboardType;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,

      decoration: InputDecoration(
        suffixIcon: icon != null ? icon : SizedBox.shrink(),
        suffixIconColor: Color(0xffC9CECF),
        hintText: hintText,
        hintStyle: AppTextStyles.smallBold13.copyWith(color: Color(0xff949D9E)),
        filled: true,
        fillColor: Color(0xffF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: Color(0xffE6E9EA), width: 1),
    );
  }
}
