import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/features/on_boarding/presentation/location_permission_screen.dart';
import 'package:elevate_ecommerce_driver/features/on_boarding/presentation/on_boarding_view_model.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<OnBoardingViewModel>();
    return BlocProvider(
      create: (context) => viewModel..handleIntent(CheckCacheIntent()),
      child: BlocListener<OnBoardingViewModel, BoardingScreenState>(
        listener: (context, state) {
          if (state is LoggedInState) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppRoutes.mainLayOut, (Route route) => false);
            });
          }
          if (state is LocationDenied) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const LocationPermissionScreen(),
                  ),
                  (Route route) => false);
            });
          }
        },
        child: Scaffold(
          body: BlocBuilder<OnBoardingViewModel, BoardingScreenState>(
            builder: (context, state) {
              if (state is LoadingScreenState ||
                  state is LoggedInState ||
                  state is LocationDenied) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset(
                      'assets/lotties/boarding_lottie.json',
                      height: 350,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      "Welcome To\nFlowery rider app",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    // CountryDropDown(
                    //   viewModel: viewModel,
                    // ),
                    // const SizedBox(
                    //   height: 24,
                    // ),
                    CustomButton(
                      text: StringsManager.login.tr(),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.loginScreen);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity.w, 48.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            side: const BorderSide(color: Colors.black)),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.applyRoute);
                      },
                      child: Text(
                        StringsManager.apply.tr(),
                        style:
                            TextStyle(fontSize: 16.sp, color: Colors.grey[800]),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
