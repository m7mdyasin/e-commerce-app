import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/core/widgets/custom_notfication_widget.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: CustomNotficationWidget(),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.baseRegular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text('محمد ياسين', style: AppTextStyles.baseBold16),
    );
  }
}
