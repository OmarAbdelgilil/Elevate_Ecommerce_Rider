

import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/widgets/custom_button.dart';
import 'package:elevate_ecommerce_driver/core/widgets/custom_textfield.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyEmail extends StatelessWidget {
  final Exception? exception;
  final Function(String email) sendOtp;
  final TextEditingController emailController;
  final String? Function(String?) emailValidator;
  final GlobalKey<FormState> formKey;
  const VerifyEmail(
      {super.key,
      required this.emailController,
      required this.emailValidator,
      required this.sendOtp,
      required this.formKey,
      this.exception});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringsManager.verifyEmailScreenTitle.tr(),
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.sp),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
                textAlign: TextAlign.center,
                StringsManager.verifyEmailScreenEmailGuide.tr(),
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.sp)),
            SizedBox(
              height: 30.h,
            ),
            CustomTextField(
              hint: StringsManager.emailFieldHint.tr(),
              controller: emailController,
              validator: emailValidator,
              label: StringsManager.emailFieldLabel.tr(),
              errorText: exception != null
                  ? StringsManager.emailFieldError.tr()
                  : null,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomButton(
              text: StringsManager.continueButtonText.tr(),
              color: ColorManager.primary,
              onPressed: () {
                sendOtp(emailController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
