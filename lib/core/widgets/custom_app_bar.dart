import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

AppBar customAppBar(context, {required String title, bool isPop = true}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    leading: isPop
        ? IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          )
        : SizedBox(),
    title: Text(title, style: AppTextStyles.bodyLargeBold19),
  );
}
