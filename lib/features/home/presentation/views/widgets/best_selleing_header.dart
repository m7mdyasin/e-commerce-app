import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/features/home/presentation/best_selleing_view.dart';

class BestSelleingHeader extends StatelessWidget {
  const BestSelleingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الأكثر مبيعًا',
          style: AppTextStyles.baseBold16.copyWith(color: Colors.black),
        ),
        TextButton(
          onPressed: () =>
              Navigator.pushNamed(context, BestSelleingView.routeName),

          child: Text(
            'المزيد',
            style: AppTextStyles.smallBold13.copyWith(color: Color(0xff949D9E)),
          ),
        ),
      ],
    );
  }
}
