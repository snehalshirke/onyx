import 'package:flutter/material.dart';
import 'package:onyx/utils/routes/routes_name.dart';
import 'package:onyx/view/home.dart';
import 'package:onyx/view/login_screen.dart';
import 'package:onyx/view/otpverification_screen.dart';
import 'package:onyx/view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.otpVerification:
        return MaterialPageRoute(
            builder: (BuildContext context) => const OtpVerificationScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No routes defined'),
              ),
            );
          },
        );
    }
  }
}
