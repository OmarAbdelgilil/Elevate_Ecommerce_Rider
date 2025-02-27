import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/common/widgets/main_app_bar.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/apply_screen/view/widgets/apply_screen_body.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/base_states.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/cubit_builder.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/cubit_listener.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/continue_screen/continue_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/di.dart';
import '../../../../../../utils/strings_manager.dart';
import '../view_model/apply_viewmodel.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  MainAppBar(title: StringsManager.applyAppBar.tr(),),
      body: BlocProvider(
        create: (context) => getIt.get<ApplyViewModel>()..start(),
        child: BlocConsumer<ApplyViewModel, BaseState>(
          listener: (context, state) {
            if (state is SuccessState) {
Navigator.pushNamed(context, AppRoutes.continueScreen);
            }
            return baseListener(context, state);

          },
          builder: (context, state) {
            return baseBuilder(context, state, ApplyScreenBody(viewModel: ApplyViewModel.get(context)));
          },
      
        ),
      ),
    );
  }
}
