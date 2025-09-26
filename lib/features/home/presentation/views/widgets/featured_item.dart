import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/custom_home_button.dart';
import 'package:gap/gap.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    var itemHeight = MediaQuery.sizeOf(context).height;
    return SizedBox(
      width: itemWidth,
      child: Stack(
        children: [
          Image.asset(
            Assets.imagesImageCoverTest,
            fit: BoxFit.cover,
            height: itemHeight * 0.27,
            width: itemWidth,
          ),
          Positioned.fill(
            child: Container(color: AppColors.primaryColor.withOpacity(0.7)),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Gap(50),
                    Text(
                      "عروض العيد",
                      style: AppTextStyles.smallBold13.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Gap(24),
                    Text(
                      "خصم %25",
                      style: AppTextStyles.heading5Bold23.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const Gap(24),
                    SizedBox(
                      width: itemWidth * 0.5,
                      child: CustomHomeButton(onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
