import 'package:flutter/material.dart';
import 'package:fruits_market/features/auth/presentation/views/forget_password_view.dart';
import 'package:fruits_market/features/auth/presentation/views/signin_view.dart';
import 'package:fruits_market/features/auth/presentation/views/signup_view.dart';
import 'package:fruits_market/features/home/presentation/best_selleing_view.dart';
import 'package:fruits_market/features/home/presentation/views/home_view.dart';
import 'package:fruits_market/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruits_market/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    /// splash view
    case SplashView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashView());

    /// on boarding view
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());

    /// sign in view
    case SigninView.routeName:
      return MaterialPageRoute(builder: (_) => const SigninView());

    /// forget passowrd view
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (_) => const ForgetPasswordView());

    /// sign up view
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpView());

    /// home view
    case HomeView.routeName:
      return MaterialPageRoute(builder: (_) => const HomeView());

    /// best selleing view
    case BestSelleingView.routeName:
      return MaterialPageRoute(builder: (_) => const BestSelleingView());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
