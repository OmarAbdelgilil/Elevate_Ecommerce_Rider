import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/viewmodels/ongoing_order_view_model.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/dynamic_card.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/order_item_card.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/order_status_container.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/store_address_card.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/user_address_card.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OngoingOrderScreen extends StatelessWidget {
  const OngoingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModal = getIt<OngoingOrderViewModel>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            StringsManager.orderDetailsTitle,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        body: BlocProvider(
            create: (context) => viewModal..doIntent(GetOngoingOrder()),
            child: BlocListener<OngoingOrderViewModel, OngoingOrderState>(
              listener: (context, state) {
                if (state is OrderDeliveredState) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.successOrder, (Route route) => false);
                  });
                }
              },
              child: BlocBuilder<OngoingOrderViewModel, OngoingOrderState>(
                builder: (context, state) {
                  if (state is LoadingState || state is OrderDeliveredState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuccessState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 5),
                      child: Column(
                        children: [
                          Row(children: state.stepper),
                          const SizedBox(
                            height: 8,
                          ),
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                OrderStatusContainer(
                                    status: state.order.status ?? '',
                                    orderNumber: state.order.orderNumber!,
                                    date: state.order.createdAt!),
                                Text(
                                  StringsManager.pickupAddress.tr(),
                                  style: const TextStyle(
                                      color: ColorManager.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                StoreAddressCard(
                                  data: state.order.store!,
                                  userData: state.order.user!,
                                  showIcons: true,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  StringsManager.userAddress.tr(),
                                  style: const TextStyle(
                                      color: ColorManager.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                UserAddressCard(
                                  storeData: state.order.store!,
                                  data: state.order.user!,
                                  showIcons: true,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  StringsManager.orderDetails.tr(),
                                  style: const TextStyle(
                                      color: ColorManager.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      itemCount: state.order.orderItems!.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: OrderItemCard(
                                            data:
                                                state.order.orderItems![index]),
                                      ),
                                    ),
                                  ),
                                ),
                                DynamicCard(
                                    title: StringsManager.total.tr(),
                                    data: 'EGP ${state.order.totalPrice}'),
                                const SizedBox(
                                  height: 16,
                                ),
                                DynamicCard(
                                    title: StringsManager.paymentMethod.tr(),
                                    data: state.order.paymentType!),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: CustomButton(
                                    text: state.buttonText,
                                    color: state.order.status ==
                                            StringsManager.orderCompletedStatus
                                                .tr()
                                        ? ColorManager.lightGrey
                                        : null,
                                    onPressed: () {
                                      viewModal.doIntent(
                                          UpdateOrderStatus(state.order));
                                    },
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    );
                  }
                  if (state is ErrorState) {
                    Center(
                      child: Text(state.error.toString()),
                    );
                  }
                  return const Placeholder();
                },
              ),
            )));
  }
}
