import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressSection extends StatelessWidget {
  final String title;
  final String name;
  final String address;
  final String imageUrl;
  final bool isStore;

  const AddressSection({
    Key? key,
    required this.title,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.isStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: isStore
                    ? Colors.pink
                    : Colors.grey.shade200, // Store-specific styling
                child: ClipOval(
                  child: Image.network(
                    imageUrl.isNotEmpty ? imageUrl : '',
                    fit: BoxFit.cover,
                    width: 40.w,
                    height: 40.h,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          name.isNotEmpty ? name[0].toUpperCase() : '?',
                          style: TextStyle(
                            color: isStore ? Colors.white : Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16.w,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            address,
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
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
      ],
    );
  }
}
