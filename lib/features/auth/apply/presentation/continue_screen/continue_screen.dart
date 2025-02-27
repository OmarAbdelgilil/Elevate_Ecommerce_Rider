import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SVGAssets.apply),
            SizedBox(height:20 ,),
            Text(StringsManager.applicationMessage.tr()),
            SizedBox(height:20 ,),
            Text(StringsManager.applicationMessage2.tr()),
            SizedBox(height:20 ,),
            CustomButton(text: StringsManager.login.tr(),onPressed: () {
              Navigator.pushNamed(context, AppRoutes.loginScreen );
            },)
          ],
        ),
      ),
    );
  }
}
