import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessOrderScreen extends StatelessWidget {
  const SuccessOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/success_icon.svg",
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              StringsManager.thankYou,
              style: TextStyle(fontSize: 24.sp, color: Colors.green),
            ),
            Text(
              StringsManager.successMessage,
              style: TextStyle(fontSize: 24.sp),
            ),
            Text(
              StringsManager.successfully,
              style: TextStyle(fontSize: 24.sp),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: CustomButton(
                text: StringsManager.doneBtn,
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      AppRoutes.mainLayOut, (Route route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
