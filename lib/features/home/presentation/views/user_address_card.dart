import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/user.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flutter/material.dart';

class UserAddressCard extends StatelessWidget {
  final User data;
  const UserAddressCard({super.key, required this.data});

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
              backgroundImage: NetworkImage(data.photo!),
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
                    '${data.firstName!} ${data.lastName}',
                    style: const TextStyle(color: ColorManager.darkGrey),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Icon(Icons.location_on_outlined),
                    Text(
                      "NA",
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
