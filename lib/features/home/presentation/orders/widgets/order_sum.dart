import 'package:elevate_ecommerce_driver/features/home/presentation/orders/cubit/get_all_orders_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersSummary extends StatelessWidget {
  const OrdersSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  context.select((OrdersViewModel vm) =>
                      vm.cancelledOrdersCount.toString()),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cancel, color: Colors.red, size: 16.w),
                    SizedBox(width: 4.w),
                    Text(
                      'Cancelled',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 40.h,
            color: Colors.grey.withOpacity(0.3),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  context.select((OrdersViewModel vm) =>
                      vm.completedOrdersCount.toString()),
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 16.w),
                    SizedBox(width: 4.w),
                    Text(
                      'Completed',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
