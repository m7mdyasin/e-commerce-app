import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/constans.dart';
import 'package:fruits_market/core/services/shared_prefrences_singleton.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:fruits_market/features/auth/presentation/views/login_view.dart';
import 'package:gap/gap.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.backgroundColor,
    required this.isVisible,
  });

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final Color backgroundColor;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundImage,
                  color: backgroundColor,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: SvgPicture.asset(image),
              ),
              SafeArea(
                child: Visibility(
                  visible: isVisible,
                  child: TextButton(
                    onPressed: () {
                      Prefs.setBool(kisOnBoardingViewSeen, true);

                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginView.routeName);
                    },
                    child: Text(
                      'تخط',
                      style: AppTextStyles.smallRegular13.copyWith(
                        color: Color(0xff949D9E),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(40),
        title,
        Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.smallBold13.copyWith(color: Color(0xff4E5556)),
          ),
        ),
      ],
    );
  }
}
