import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flutter/material.dart';

class OrderStatusContainer extends StatelessWidget {
  final String status;
  final String orderNumber;
  final DateTime date;
  const OrderStatusContainer(
      {super.key,
      required this.status,
      required this.orderNumber,
      required this.date});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('EEE, dd MMM yyyy, hh:mm a').format(date);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorManager.lightPink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status : $status",
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              "Order ID : $orderNumber",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              formattedDate,
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}
