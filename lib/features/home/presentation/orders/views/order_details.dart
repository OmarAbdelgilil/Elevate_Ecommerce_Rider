import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import '../widgets/address_section.dart';
import '../widgets/order_item_card.dart';

class OrderDetailsScreen extends StatelessWidget {
  final Orders order;

  const OrderDetailsScreen({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          StringsManager.orderDetailsTitle,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                Icon(
                  order.order?.state == 'completed'
                      ? Icons.check_circle
                      : Icons.cancel,
                  color: order.order?.state == 'completed'
                      ? Colors.green[600]
                      : Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  order.order?.state?.toUpperCase() ?? '',
                  style: TextStyle(
                    color: order.order?.state == 'completed'
                        ? Colors.green[600]
                        : Colors.red,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order Number
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  ' ${order.order?.orderNumber ?? ''}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              AddressSection(
                  title: StringsManager.pickupAddress,
                  name: order.store?.name ?? '',
                  address: order.store?.address ?? '',
                  imageUrl: order.store?.image ?? '',
                  isStore: true),

              AddressSection(
                  title: StringsManager.userAddress,
                  name:
                      '${order.order?.user?.firstName ?? ''} ${order.order?.user?.lastName ?? ''}',
                  address: order.store?.address ?? '',
                  imageUrl: order.order?.user?.photo ?? '',
                  isStore: false),

              const SizedBox(height: 24),

              const Text(
                StringsManager.orderDetails,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
              ...order.order?.orderItems?.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: OrderItemCard(
                        name: 'Product ${item.product?.sId ?? ''}',
                        price: 'EGP ${item.price?.toString() ?? '0'}',
                        quantity: item.quantity ?? 0,
                        imageUrl:
                            'https://images.unsplash.com/photo-1548586196-aa5803b77379?w=100&h=100&fit=crop',
                      ),
                    ),
                  ) ??
                  [],
              const SizedBox(height: 24),

              Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[200]!),
                  ),
                ),
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          StringsManager.total,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                            'EGP ${order.order?.totalPrice?.toString() ?? '0'}'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringsManager.paymentMethod,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          order.order?.paymentType?.toUpperCase() ?? 'N/A',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
