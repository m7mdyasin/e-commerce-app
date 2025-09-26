import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/best_selling_view_body.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/build_best_selling_app_bar.dart';

class BestSelleingView extends StatelessWidget {
  const BestSelleingView({super.key});

  static const routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildBestSellingAppBar(),
      body: BestSellingViewBody(),
    );
  }
}
