import 'package:flutter/material.dart';
import 'package:myclig/core/constants/route_names.dart';
import 'package:myclig/features/default/presentation/pages/dashboard.dart';
import 'package:myclig/features/default/presentation/pages/landing_page.dart';
import 'package:myclig/features/default/presentation/pages/splash_screen.dart';
import 'package:myclig/features/user/presentation/pages/edit_profile_page.dart';
import 'package:myclig/features/user/presentation/pages/forget_password_page.dart';
import 'package:myclig/features/user/presentation/pages/login_page.dart';
import 'package:myclig/features/user/presentation/pages/profile_page.dart';
import 'package:myclig/features/user/presentation/pages/registration_page.dart';
import 'package:myclig/features/user/presentation/pages/verify_registration_page.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_SCREEN:
        return MaterialPageRoute(
          builder: (_) => LandingPage(),
        );
      case SPLASHSCREEN:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
        );
      case PROFILE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ProfileScreen(),
        );
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(
          builder: (_) => DashBoardScreen(),
        );
      case LOGIN_SCREEN:
        return MaterialPageRoute(
          builder: (_) => LoginPage(),
        );
      case VERIFY_REGISTRATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => VerifyRegistrationPage(
            userEntity: settings.arguments,
          ),
        );
      case EDIT_PROFILE_SCREEN:
        return MaterialPageRoute(
          builder: (_) => EditProfilePage(),
        );
      case REGISTRATION_SCREEN:
        return MaterialPageRoute(
          builder: (_) => RegistrationPage(),
        );
      case FORGET_PASSWORD_SCREEN:
        return MaterialPageRoute(
          builder: (_) => ForgetPasswordPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Text('404'),
        );
    }
  }
}
