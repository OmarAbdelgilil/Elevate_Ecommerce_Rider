import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/viewmodels/ongoing_order_view_model.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/order_status_container.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OngoingOrderScreen extends StatelessWidget {
  const OngoingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModal = getIt<OngoingOrderViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            StringsManager.orderDetailsTitle,
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocProvider(
            create: (context) => viewModal..doIntent(GetOngoingOrder()),
            child: BlocBuilder<OngoingOrderViewModel, OngoingOrderState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SuccessState) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8),
                        child: Row(children: state.stepper),
                      ),
                      OrderStatusContainer(
                          status: state.order.status ?? '',
                          orderNumber: state.order.orderNumber!,
                          date: state.order.createdAt!)
                    ],
                  );
                }
                if (state is ErrorState) {
                  Center(
                    child: Text(state.error.toString()),
                  );
                }
                return const Placeholder();
              },
            )));
  }
}
