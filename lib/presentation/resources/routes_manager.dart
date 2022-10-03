import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/auth/forgot_password/forgot_password_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/auth/login/login_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/auth/register/register_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/main/main_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/onboarding/view/onboarding_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/splash/splash_view.dart';
import 'package:clean_architecture_with_mvvm/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: ((context) => const SplashView()),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: ((context) => const OnBoradingView()),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: ((context) => const LoginView()),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: ((context) => const RegisterView()),
        );
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(
          builder: ((context) => const ForgotPasswordView()),
        );
      case Routes.mainRoute:
        return MaterialPageRoute(
          builder: ((context) => const MainView()),
        );
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(
          builder: ((context) => const StoreDetailsView()),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              AppStrings.noRouteFound,
            ),
          ),
          body: const Center(
            child: Text(
              AppStrings.noRouteFound,
            ),
          ),
        );
      }),
    );
  }
}
