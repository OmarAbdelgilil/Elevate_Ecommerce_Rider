import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/ongoing_order_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/order_card.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<HomeViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          StringsManager.appTitle,
          style: TextStyle(
              fontFamily: StringsManager.iMFellfont,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
      body: BlocProvider(
          create: (context) => viewModel..doIntent(GetOrdersIntent()),
          child: BlocListener<HomeViewModel, HomeScreenState>(
            listener: (context, state) {
              if (state is OrderOngoingState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OngoingOrderScreen(),
                    ));
              }
              return;
            },
            child: BlocBuilder<HomeViewModel, HomeScreenState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is SuccessState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      viewModel.doIntent(GetOrdersIntent());
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height - 10,
                      child: ListView.builder(
                        itemCount: viewModel.orders.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: OrderCard(
                              key: UniqueKey(),
                              orderDetails: viewModel.orders[index],
                              viewModel: viewModel,
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  return const Placeholder();
                }
              },
            ),
          )),
    );
  }
}
