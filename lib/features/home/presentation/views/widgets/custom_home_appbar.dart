import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: SvgPicture.asset(
        Assets.imagesNotification,
        height: 40,
        width: 40,
      ),
      leading: Image.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.baseRegular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text('محمد ياسين', style: AppTextStyles.baseBold16),
    );
  }
}
