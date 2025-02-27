import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/order_item.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final OrderItem data;
  const OrderItemCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.darkGrey,
              child: CachedNetworkImage(
                imageUrl: data.product!.imgCover!,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.inventory_2, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.product!.title!,
                  style: const TextStyle(color: ColorManager.darkGrey),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "EGP ${data.price}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "X${data.quantity}",
                      style: const TextStyle(color: ColorManager.pink),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
