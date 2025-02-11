import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_page_viewmodel.dart';

class HomePageViewMobile extends ViewModelWidget<HomePageViewModel> {
  const HomePageViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
