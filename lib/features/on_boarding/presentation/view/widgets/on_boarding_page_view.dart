import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_images.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/features/on_boarding/presentation/view/widgets/fruit_hub_text.dart';
import 'package:fruits_market/features/on_boarding/presentation/view/widgets/page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
    required this.onPageChanged,
  });
  final PageController pageController;
  final ValueChanged<int> onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: onPageChanged,
      controller: pageController,
      children: [
        PageViewItem(
          image: Assets.imagesPageViewItem1Image,
          backgroundImage: Assets.imagesPageViewItem1Background,
          subtitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title: FruitHubText(),
          backgroundColor: Color.fromARGB(150, 209, 187, 145),
          isVisible: true,
        ),

        PageViewItem(
          isVisible: false,
          image: Assets.imagesPageViewItem2Image,
          backgroundImage: Assets.imagesPageViewItem2Background,
          subtitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title: Text(
            'ابحث وتسوق',
            style: AppTextStyles.heading3Bold33.copyWith(color: Colors.black),
          ),
          backgroundColor: Color(0xffB0E8C7),
        ),
      ],
    );
  }
}
