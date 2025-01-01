import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/login_validator/login_validator.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/login_validator/login_validator_types.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/widgets/remember_me_button.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  final loginValidator = LoginValidator();
  final ValueNotifier<bool> rememberMeNotifier = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return buildLoginForm(context);
  }

  Widget buildLoginForm(BuildContext context) {
    return Form(
      key: loginValidator.loginFormKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 24),
            CustomTextField(
              hint: StringsManager.enterEmail.tr(),
              controller: loginValidator.emailController,
              validator: loginValidator.validate(LoginValidatorTypes.email),
              label: StringsManager.email.tr(),
            ),
            const SizedBox(height: 24),
            CustomTextField(
              obscureText: true,
              controller: loginValidator.passwordController,
              validator: loginValidator.validate(LoginValidatorTypes.password),
              hint: StringsManager.enterPass.tr(),
              label: StringsManager.pass.tr(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RememberMeCheckbox(notifier: rememberMeNotifier),
                TextButton(
                  onPressed: () {},
                  // Navigator.pushNamed(context, AppRoutes.forgetPassword),
                  child: Text(
                    StringsManager.forgetPass.tr(),
                    style: const TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.black,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 290.h),
            Align(
              alignment: Alignment.bottomCenter,
              child: BlocBuilder<LoginViewModel, LoginState>(
                  builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  text: StringsManager.continueButton.tr(),
                  onPressed: () {
                    if (loginValidator.loginFormKey.currentState?.validate() ??
                        false) {
                      final rememberMeState = rememberMeNotifier.value;

                      context.read<LoginViewModel>().handleIntent(
                            LoginIntent(
                              email: loginValidator.emailController.text,
                              password: loginValidator.passwordController.text,
                              rememberMe: rememberMeState,
                            ),
                          );
                    }
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
