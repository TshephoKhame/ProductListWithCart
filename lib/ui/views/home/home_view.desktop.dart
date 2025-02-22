import 'package:product_list/ui/common/app_colors.dart';
import 'package:product_list/ui/common/app_constants.dart';
import 'package:product_list/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:product_list/ui/views/home/Widget/product_cart.dart';
import 'package:product_list/ui/views/home/Widget/product_container.dart';
import 'package:product_list/ui/views/home/Widget/product_list.dart';
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
          padding: const EdgeInsets.only(
            left: 100,
            right: 100,
            top: 60,
          ),
          color: kcrose100,
          width: screenWidth(context),
          height: screenHeight(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProductList(vm: viewModel),
              horizontalSpaceMedium,
              ProductCart(vm: viewModel)
            ],
          ),
        ),
      ),
    );
  }
}
