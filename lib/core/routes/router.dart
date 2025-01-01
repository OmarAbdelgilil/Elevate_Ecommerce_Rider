import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/presentation/update_password_view/update_password_view.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/main_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/home_screen.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/views/login_view.dart';
import 'package:flutter/material.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

      //mainLayOut
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
      //forget password
    case AppRoutes.forgetPassword:
      return MaterialPageRoute(builder: (context) => ForgetPasswordScreen());
      //change password
    case AppRoutes.ResetPassword:
      return MaterialPageRoute(
          builder: (context) => const UpdatePasswordView());
    case AppRoutes.loginScreen:
      return MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
