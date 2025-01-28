import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_entity.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/viewmodels/home_view_model.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/store_address_card.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/views/user_address_card.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity orderDetails;
  final HomeViewModel viewModel;
  const OrderCard(
      {super.key, required this.orderDetails, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 0),
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Flower order",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Pickup address",
              style: TextStyle(color: ColorManager.darkGrey),
            ),
            StoreAddressCard(data: orderDetails.store!),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "User address",
              style: TextStyle(color: ColorManager.darkGrey),
            ),
            UserAddressCard(data: orderDetails.user!),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  'EGP ${orderDetails.totalPrice.toString()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Spacer(),
                CustomButton(
                  text: "Reject",
                  fontColor: Theme.of(context).colorScheme.primary,
                  color: Colors.white,
                  borderColor: Theme.of(context).colorScheme.primary,
                  height: 45,
                  width: 120,
                  onPressed: () {
                    viewModel.doIntent(RejectOrderIntent(orderDetails.id!));
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                const CustomButton(
                  text: "Accept",
                  height: 45,
                  width: 120,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
