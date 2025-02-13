import 'package:elevate_ecommerce_driver/features/home/presentation/orders/cubit/get_all_orders_viewmodel.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/orders/widgets/order_card2.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/orders/widgets/order_sum.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<OrdersViewModel>()..doIntent(LoadOrdersIntent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: BackButton(color: Colors.black),
          title: Text(
            StringsManager.ordersTab,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocBuilder<OrdersViewModel, OrdersState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrdersSummary(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(
                    'Recent orders',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Expanded(
                  child: switch (state) {
                    InitialState() => const SizedBox(),
                    LoadingState() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    SuccessState(orders: final orders) => ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        itemCount: orders?.length ?? 0,
                        itemBuilder: (context, index) {
                          return OrderCard2(order: orders![index]);
                        },
                      ),
                    ErrorState(exception: final error) => Center(
                        child: Text(error?.toString() ?? 'Unknown error'),
                      ),
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
