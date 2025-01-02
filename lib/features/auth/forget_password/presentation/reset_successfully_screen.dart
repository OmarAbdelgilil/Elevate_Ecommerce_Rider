import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class ResetSuccessfullyScreen extends StatelessWidget {
  final BuildContext mainContext;
  const ResetSuccessfullyScreen({super.key, required this.mainContext});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(mainContext)
          .pushNamedAndRemoveUntil(AppRoutes.loginScreen, (Route route) => false);
    });
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(LottieAssets.success),
              SizedBox(
                height: 5.h,
              ),
              Text(
                StringsManager.passwordResetSuccess.tr(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
