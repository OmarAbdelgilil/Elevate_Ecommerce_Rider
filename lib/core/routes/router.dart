import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/profile_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
    case AppRoutes.profileScreen:
      return MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
