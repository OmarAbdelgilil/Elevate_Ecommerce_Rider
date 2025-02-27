import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final Color? fontColor;
  final double fontSize;
  final double? radius;
  final Color? borderColor;
  const CustomButton(
      {super.key,
      required this.text,
      this.onPressed,
      this.color,
      this.width = double.infinity,
      this.height = 48,
      this.fontSize = 16,
      this.fontColor,
      this.radius,
      this.borderColor});
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width.w, height.h),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 100.r),
            side: BorderSide(
                color: borderColor ??
                    color ??
                    Theme.of(context).colorScheme.primary)),
        disabledBackgroundColor: color ?? Theme.of(context).colorScheme.primary,
        backgroundColor: color ?? Theme.of(context).colorScheme.primary,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize.sp, color: fontColor ?? const Color(0xffF9F9F9)),
      ),
    );
  }
}
