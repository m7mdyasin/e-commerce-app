import 'package:flutter/material.dart';
import 'package:fruits_market/core/helper_functions/on_generate_routes.dart';
import 'package:fruits_market/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitsApp());
}

class FruitsApp extends StatelessWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
    );
  }
}
