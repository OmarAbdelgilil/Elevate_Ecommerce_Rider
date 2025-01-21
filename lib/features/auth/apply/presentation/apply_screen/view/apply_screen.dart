import 'package:elevate_ecommerce_driver/core/common/widgets/main_app_bar.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/apply_screen/view/widgets/apply_screen_body.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/base_states.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/cubit_builder.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/presentation/base/cubit_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/di.dart';
import '../view_model/apply_viewmodel.dart';

class ApplyScreen extends StatelessWidget {
  const ApplyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'Apply',),
      body: BlocProvider(
        create: (context) => getIt.get<ApplyViewModel>()..start(),
        child: BlocConsumer<ApplyViewModel, BaseState>(
          listener: (context, state) {
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
