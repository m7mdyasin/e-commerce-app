import 'package:flutter/material.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/core/widgets/custom_text.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:fruits_market/core/widgets/or_divider.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/dont_have_account_widget.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/social_button.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Gap(24),
            CustomTextField(
              hintText: 'البريد الإلكتروني',
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16),

            CustomTextField(
              hintText: 'كلمة المرور',
              keyboardType: TextInputType.visiblePassword,
              icon: const Icon(Icons.visibility),
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: CustomText(
                text: 'نسيت كلمة المرور؟',
                onPressed: () {},
                color: AppColors.lightPrimaryColor,
              ),
            ),
            const Gap(15),
            CustomButton(text: 'تسجيل الدخول', onPressed: () {}),
            const Gap(33),
            const DontHaveAccountWidget(),
            const Gap(33),
            OrDivider(text: 'أو'),
            const Gap(20),
            SocialButton(
              text: 'تسجيل بواسطة جوجل',
              assetPath: Assets.imagesGoogle,
              onTap: () {},
            ),
            const Gap(16),

            SocialButton(
              text: 'تسجيل بواسطة أبل',
              assetPath: Assets.imagesApple,
              onTap: () {},
            ),
            const Gap(16),

            SocialButton(
              text: 'تسجيل بواسطة فيسبوك',
              assetPath: Assets.imagesFacebook,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
