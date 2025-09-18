import 'package:flutter/material.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/agrreement_widget.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/have_account.dart';
import 'package:gap/gap.dart' show Gap;

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
        child: Column(
          children: [
            const Gap(24),

            CustomTextFormField(
              hintText: 'الاسم كامل',
              keyboardType: TextInputType.name,
            ),
            const Gap(16),
            CustomTextFormField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.name,
            ),
            const Gap(16),
            CustomTextFormField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.name,
              icon: const Icon(Icons.visibility),
            ),
            const Gap(16),

            AgrreementWidget(),
            const Gap(30),

            CustomButton(text: 'إنشاء حساب جديد', onPressed: () {}),
            const Gap(26),

            HaveAccount(),
          ],
        ),
      ),
    );
  }
}
