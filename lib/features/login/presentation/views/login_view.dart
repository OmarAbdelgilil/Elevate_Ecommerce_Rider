import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';

import 'package:elevate_ecommerce_driver/features/login/presentation/cubit/login_viewmodel.dart';
import 'package:elevate_ecommerce_driver/features/login/presentation/widgets/login_view_body.dart';
import 'package:elevate_ecommerce_driver/main.dart';
import 'package:elevate_ecommerce_driver/utils/custom_appbar.dart';
import 'package:elevate_ecommerce_driver/utils/extract_error_message.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<LoginViewModel>()..handleIntent(CheckCacheIntent()),
        child: BlocListener<LoginViewModel, LoginState>(
            listener: (context, state) {
          if (state is SuccessState || state is LoggedInState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.mainLayOut, (Route route) => false);
            });
          }

          if (state is ErrorState) {
            scaffoldMessengerKey.currentState?.clearSnackBars();
            var snackBarText = extractErrorMessage(state.exception);
            final snackBar = SnackBar(
              content: Text(snackBarText),
              duration: const Duration(seconds: 2),
            );
            scaffoldMessengerKey.currentState?.showSnackBar(snackBar);
          }
        }, child: BlocBuilder<LoginViewModel, LoginState>(
          builder: (context, state) {
            if (state is LoadingScreenState || state is LoggedInState) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return Scaffold(
                appBar: customAppBar(
                  title: StringsManager.login.tr(),
                ),
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: LoginViewBody(),
                ));
          },
        )));
  }
}
