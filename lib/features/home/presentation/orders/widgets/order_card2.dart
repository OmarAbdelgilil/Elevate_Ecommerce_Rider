import 'package:elevate_ecommerce_driver/features/home/data/models/response/order_respose2/order_response2/order_response2.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/orders/views/order_details.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/address_section.dart';

class OrderCard2 extends StatelessWidget {
  final Orders order;

  const OrderCard2({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isCompleted = order.order?.state == 'completed';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringsManager.orderCardTitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      isCompleted ? Icons.check_circle : Icons.cancel,
                      color: isCompleted ? Colors.green : Colors.red,
                      size: 16.w,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      isCompleted ? 'Completed' : 'Cancelled',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: isCompleted ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                Text(
                  ' ${order.order?.orderNumber ?? '123456'}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            AddressSection(
                title: StringsManager.pickupAddress,
                name: order.store?.name ?? 'Flowery store',
                address: order.store?.address ?? '20th st, Sheikh Zayed, Giza',
                imageUrl: order.store?.image ?? '',
                isStore: true),
            SizedBox(height: 12.h),
            AddressSection(
                title: StringsManager.userAddress,
                name:
                    '${order.order?.user?.firstName ?? 'Nour'} ${order.order?.user?.lastName ?? 'mohamed'}',
                address: order.store?.address ?? '20th st, Sheikh Zayed, Giza',
                imageUrl: order.order?.user?.photo ?? '',
                isStore: false),
          ],
        ),
      ),
    );
  }
}
