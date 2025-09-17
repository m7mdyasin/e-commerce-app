import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/widgets/custom_button.dart';
import 'package:fruits_market/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';
import 'package:gap/gap.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage = 0;
  @override
  void initState() {
    pageController = PageController();

    pageController.addListener(() {
      currentPage = pageController.page!.round();
    });
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(
            pageController: pageController,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: currentPage.toDouble(),
          decorator: DotsDecorator(
            activeColor: AppColors.primaryColor,
            color: const Color.fromARGB(49, 93, 185, 87),
          ),
        ),
        Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Visibility(
            maintainAnimation: true,
            maintainSize: true,
            maintainState: true,
            visible: currentPage == 1 ? true : false,
            child: CustomButton(text: 'ابدأ الان', onPressed: () {}),
          ),
        ),
        Gap(43),
      ],
    );
  }
}
