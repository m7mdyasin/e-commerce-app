import 'package:flutter/material.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/custom_home_appbar.dart';
import 'package:fruits_market/features/home/presentation/views/widgets/custom_search_bar.dart';

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
            ],
          ),
        ),
      ],
    );
  }
}
