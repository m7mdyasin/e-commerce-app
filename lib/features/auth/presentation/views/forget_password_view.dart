import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'forgetpassword';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'نسيان كلمة المرور'),
      body: ForgetPasswordViewBody(),
    );
  }
}
