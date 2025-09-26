import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/widgets/custom_notfication_widget.dart';

AppBar buildBestSellingAppBar() {
  return AppBar(
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomNotficationWidget(),
      ),
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text('الأكثر مبيعًا', style: AppTextStyles.bodyLargeBold19),
  );
}
