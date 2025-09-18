import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'تسجيل دخول', context),
      body: LoginViewBody(),
    );
  }
}
