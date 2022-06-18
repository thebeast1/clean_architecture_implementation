import 'package:clean_arc_imp/config/routes/app_routes.dart';
import 'package:clean_arc_imp/config/themes/app_theme.dart';
import 'package:clean_arc_imp/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

class QuoteApp extends StatelessWidget {
  const QuoteApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: appTheme(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      //routes: routes,
    );
  }
}
