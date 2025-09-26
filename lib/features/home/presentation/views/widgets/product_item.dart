import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.all(5),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
        color: Color(0xffF3F5F7),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            top: 28,
            child: Column(
              children: [
                Image.asset(Assets.imagesProductTest),
                const Gap(24),
                ListTile(
                  title: Text('أفوكادو', style: AppTextStyles.smallRegular13),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '200 جنيهة',
                          style: AppTextStyles.smallBold13.copyWith(
                            color: Color(0xFFF4A91F),
                          ),
                        ),
                        TextSpan(
                          text: ' / الكيلو',
                          style: AppTextStyles.smallBold13.copyWith(
                            color: Color(0xFFF8C76D),
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: AppColors.primaryColor,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
