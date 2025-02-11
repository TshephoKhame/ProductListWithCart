import 'package:product_list/ui/common/app_colors.dart';
import 'package:product_list/ui/common/app_constants.dart';
import 'package:product_list/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(35),
          color: kcrose50,
          width: screenWidth(context),
          height: screenHeight(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Text(
                        'Desserts',
                        style: TextStyle(
                            fontSize: kcStyle * 2, fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: verticalSpaceMedium,
                    ),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: screenWidth(context) > 1350
                            ? 3
                            : screenWidth(context) > 1120
                                ? 2
                                : 1,
                        //childAspectRatio: 2.5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        Map<String, dynamic> data =
                            viewModel.data.toList()[index];
                        return Container(
                          width: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                data['image']['desktop'],
                                fit: BoxFit.fill,
                                width: 250,
                              ),
                              Text(
                                data['category'],
                                style: TextStyle(
                                  fontSize: kcStyle,
                                ),
                              ),
                              Text(
                                data['name'],
                                style: TextStyle(
                                    fontSize: kcStyle,
                                    color: kcrose900,
                                    fontWeight: FontWeight.w900),
                              ),
                              Text(
                                "\$${data['price'].toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: kcStyle,
                                  color: kcred,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        );
                      }, childCount: viewModel.data.length),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
