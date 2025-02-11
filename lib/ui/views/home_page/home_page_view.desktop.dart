import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_page_viewmodel.dart';

class HomePageViewDesktop extends ViewModelWidget<HomePageViewModel> {
  const HomePageViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomePageViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
