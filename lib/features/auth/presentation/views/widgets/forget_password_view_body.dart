import 'package:flutter/material.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/core/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizentalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            Text(
              'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
              style: AppTextStyles.baseBold16.copyWith(
                color: Color(0xff616A6B),
              ),
            ),
            const Gap(31),
            CustomTextFormField(
              hintText: 'رقم الهاتف',
              keyboardType: TextInputType.phone,
            ),
            const Gap(31),

            CustomButton(text: 'نسيت كلمة المرور', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
