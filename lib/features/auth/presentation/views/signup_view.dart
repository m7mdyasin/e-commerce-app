import 'package:flutter/material.dart';
import 'package:fruits_market/core/widgets/custom_app_bar.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'حساب جديد'),
      body: SignupViewBody(),
    );
  }
}
