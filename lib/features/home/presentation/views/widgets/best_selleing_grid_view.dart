import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/product_item.dart';

class BestSelleingGridView extends StatelessWidget {
  const BestSelleingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        return ProductItem();
      },
    );
  }
}
