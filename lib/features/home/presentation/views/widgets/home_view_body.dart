import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/best_selleing_grid_view.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/best_selleing_header.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/featured_list.dart';
import 'package:gap/gap.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomHomeAppbar(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomSearchBar(),
              ),
              const Gap(16),
              FeaturedList(),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BestSelleingHeader(),
              ),
              const Gap(8),
            ],
          ),
        ),
        BestSelleingGridView(),
      ],
    );
  }
}
