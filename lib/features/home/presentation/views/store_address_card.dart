import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/store.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flutter/material.dart';

class StoreAddressCard extends StatelessWidget {
  final Store data;
  const StoreAddressCard({super.key, required this.data});

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
              backgroundImage: NetworkImage(data.image!),
              backgroundColor: ColorManager.darkGrey,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    data.name!,
                    style: const TextStyle(color: ColorManager.darkGrey),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    Text(
                      data.address!,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
