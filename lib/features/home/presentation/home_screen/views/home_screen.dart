import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/viewmodels/home_view_model.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/ongoing_order_screen.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/order_card.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final viewModel = getIt<HomeViewModel>();
  @override
  Widget build(BuildContext context) {
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
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OngoingOrderScreen(),
                    ),
                    (Route route) => false);
              }
              return;
            },
            child: BlocBuilder<HomeViewModel, HomeScreenState>(
              builder: (context, state) {
                if (state is LoadingState || state is OrderOngoingState) {
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
                      child: viewModel.orders.isEmpty
                          ? ListView(
                              children: const [
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 200),
                                    child: Text('No orders for now'),
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
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
