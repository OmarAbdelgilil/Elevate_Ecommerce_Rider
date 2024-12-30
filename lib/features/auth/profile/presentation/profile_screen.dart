import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_header.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Profile'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.notifications_outlined),
                Transform.translate(
                  offset: Offset(-8.w, -8.h),
                  child: Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.error,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: 16.w,
                      minHeight: 16.h,
                    ),
                    child: Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const ProfileHeader(
                  name: 'John Doe',
                  email: 'John.Doe@gmail.com',
                  phone: '01211345678',
                ),
                SizedBox(height: 20.h),
                ProfileMenuItem(
                  title: 'Vehicle info',
                  subtitle: 'Bike\nUP16DL0007',
                  onTap: () {},
                ),
                Divider(height: 1.h),
                ProfileMenuItem(
                  title: 'Language',
                  subtitle: 'English',
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: () {},
                ),
                Divider(height: 1.h),
                ProfileMenuItem(
                  title: 'Logout',
                  trailing: const Icon(Icons.logout),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.r),
            child: Text(
              'v 6.3.0 - (446)',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
