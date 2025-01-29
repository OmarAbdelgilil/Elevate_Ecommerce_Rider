import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/continue_screen/continue_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/main_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/home_screen.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/views/login_view.dart';
import 'package:elevate_ecommerce_driver/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/apply/presentation/apply_screen/view/apply_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
    case AppRoutes.continueScreen:
      return MaterialPageRoute(builder: (context) => const ContinueScreen());
    case AppRoutes.boarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case AppRoutes.applyRoute:
      return MaterialPageRoute(builder: (context) => const ApplyScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
