import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

AppBar customAppBar(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(title, style: AppTextStyles.bodyLargeBold19),
  );
}
