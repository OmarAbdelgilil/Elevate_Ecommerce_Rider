import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback onTap;
  final Color? textColor;

  const ProfileMenuItem({
    super.key,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
              ),
            )
          : null,
      trailing: trailing ?? Icon(Icons.chevron_right, size: 24.r),
      onTap: onTap,
    );
  }
}
