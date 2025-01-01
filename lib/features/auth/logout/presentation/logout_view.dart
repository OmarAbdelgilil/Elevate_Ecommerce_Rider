
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/presentation/logout_viewModel.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:elevate_ecommerce_driver/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
class LogoutWidget extends StatelessWidget {
  const LogoutWidget({Key? key}) : super(key: key);

  void _showLogoutDialog(BuildContext context, LogoutViewModel viewModel) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Padding(
              padding: EdgeInsets.only(
                left: 40.w,
                right: 40.w,
                top: 10.h,
                bottom: 10.h,
              ),
              child: Column(
                children: [
                  Text(
                    'LOGOUT',
                    style: AppTextStyles.title(fontSize: 20.sp),
                  ),
                  SizedBox(height:5.h),
                  Text(
                    'Confirm logout!!',
                    style: TextStyle(fontSize: 16.sp),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            CustomButton(
              width: 60.w,
              text: 'Cancel',
              fontColor: ColorManager.darkGrey,
              onPressed: () {
                Navigator.of(context).pop(false); // Cancel
              },
              color: Colors.white,
            ),
            CustomButton(
              width: 60.w,
              text: 'Logout',
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm Logout
              },
            )
          ],
        );
      },
    );

    if (result == true) {
      await viewModel.logout();
      if (!viewModel.isLoggingOut) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<LogoutViewModel>(),
      child: Consumer<LogoutViewModel>(
        builder: (context, viewModel, child) {
          return viewModel.isLoggingOut
              ? CircularProgressIndicator()
              : InkWell(
            onTap: () => _showLogoutDialog(context, viewModel),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  SvgPicture.asset(
                    SVGAssets.logoutIcon,
                    width: 25.w,
                    height: 25.h,
                  ),
                  Text( StringsManager.logout.tr(),)
                ],),
                SvgPicture.asset(
                  SVGAssets.logoutIcon,
                  width: 35.w,
                  height: 38.h,
                  colorFilter: const ColorFilter.mode(
                      ColorManager.darkGrey, BlendMode.srcIn),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}



