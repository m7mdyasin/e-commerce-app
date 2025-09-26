import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_market/core/utils/app_images.dart';

class CustomNotficationWidget extends StatelessWidget {
  const CustomNotficationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(Assets.imagesNotification, height: 40, width: 40);
  }
}
