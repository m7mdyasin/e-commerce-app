import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:gap/gap.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: ShapeDecoration(
          color: Color(0xFFEEEEEE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(30),
          ),
        ),

        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              child: Center(child: SvgPicture.asset(image)),
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: OvalBorder(),
              ),
            ),
            Gap(4),
            Text(
              text,
              style: AppTextStyles.smallBold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
