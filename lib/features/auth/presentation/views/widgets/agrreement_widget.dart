import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/features/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:gap/gap.dart' show Gap;

class AgrreementWidget extends StatefulWidget {
  const AgrreementWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<AgrreementWidget> createState() => _AgrreementWidgetState();
}

class _AgrreementWidgetState extends State<AgrreementWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: CustomCheckBox(
            isChecked: isTermsAccepted,
            onChecked: (value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            },
          ),
        ),

        const Gap(16),
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
