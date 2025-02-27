import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/core/routes/route_not_found.dart';
import 'package:elevate_ecommerce_driver/features/auth/forget_password/presentation/forget_password_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/update_password/presentation/update_password_view/update_password_view.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/success_order_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/continue_screen/continue_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/edit_profile_screen.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/edit_vihcle.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/profile_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/main_lay_out_screen/mian_lay_out_view/mian_lay_out_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/home_screen.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/views/login_view.dart';
import 'package:elevate_ecommerce_driver/features/on_boarding/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

import '../../features/auth/apply/presentation/apply_screen/view/apply_screen.dart';

Route manageRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => HomeScreen(),
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
    case AppRoutes.mainLayOut:
      return MaterialPageRoute(builder: (context) => const MainLayOutScreen());
    case AppRoutes.continueScreen:
      return MaterialPageRoute(builder: (context) => const ContinueScreen());
    case AppRoutes.boarding:
      return MaterialPageRoute(builder: (context) => const OnBoardingScreen());
    case AppRoutes.successOrder:
      return MaterialPageRoute(
          builder: (context) => const SuccessOrderScreen());
    case AppRoutes.applyRoute:
      return MaterialPageRoute(builder: (context) => const ApplyScreen());
    case AppRoutes.profileScreen:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case AppRoutes.editVihcle:
      return MaterialPageRoute(builder: (context) => const EditVehicleScreen());
    case AppRoutes.editProfileScreen:
      return MaterialPageRoute(builder: (context) => const EditProfileScreen());
    default:
      return MaterialPageRoute(
        builder: (context) => const RouteNotFound(),
      );
  }
}
