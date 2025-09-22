import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_images.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.onChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChecked(!isChecked);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.all(3),
        width: 24,
        height: 24,
        duration: Duration(milliseconds: 150),
        decoration: ShapeDecoration(
          color: isChecked ? AppColors.primaryColor : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.5,
              color: isChecked ? Colors.transparent : Color(0xffDCDEDE),
            ),
            borderRadius: BorderRadiusGeometry.circular(8),
          ),
        ),
        child: isChecked
            ? SvgPicture.asset(Assets.imagesCheck)
            : SizedBox.shrink(),
      ),
    );
  }
}
