import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:gap/gap.dart' show Gap;

class AgrreementWidget extends StatelessWidget {
  const AgrreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Checkbox outline (no logic)
        Container(
          margin: EdgeInsets.only(top: 5),
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.greyColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const Gap(8),
        // Text with links
        Expanded(
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.baseRegular16.copyWith(color: Colors.black),
              children: [
                const TextSpan(text: 'من خلال إنشاء حساب، فإنك توافق على '),
                TextSpan(
                  text: 'الشروط والأحكام الخاصة بنا',
                  style: AppTextStyles.baseBold16.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
