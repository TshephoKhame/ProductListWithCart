import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'home_page_view.desktop.dart';
import 'home_page_view.tablet.dart';
import 'home_page_view.mobile.dart';
import 'home_page_viewmodel.dart';

class HomePageView extends StackedView<HomePageViewModel> {
  const HomePageView({super.key});

  @override
  Widget builder(
    BuildContext context,
    HomePageViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const HomePageViewMobile(),
      tablet: (_) => const HomePageViewTablet(),
      desktop: (_) => const HomePageViewDesktop(),
    );
  }

  @override
  HomePageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomePageViewModel();
}
