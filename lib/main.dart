import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:product_list/app/app.bottomsheets.dart';
import 'package:product_list/app/app.dialogs.dart';
import 'package:product_list/app/app.locator.dart';
import 'package:product_list/app/app.router.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_animate/flutter_animate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await setupLocator(stackedRouter: stackedRouter);
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (_) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            displaySmall: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w400),
            headlineSmall: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w700),
            headlineLarge: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w700),
            bodySmall: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w500),
            bodyMedium: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w400),
            labelSmall: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w400),
            labelMedium: TextStyle(
                fontFamily: 'RedHatText', fontWeight: FontWeight.w400),
          ),
        ),
        routerDelegate: stackedRouter.delegate(),
        routeInformationParser: stackedRouter.defaultRouteParser(),
      ),
    ).animate().fadeIn(
          delay: const Duration(milliseconds: 50),
          duration: const Duration(milliseconds: 400),
        );
  }
}
