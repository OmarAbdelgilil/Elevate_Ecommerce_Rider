import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../utils/text_style.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.backgroundColor = Colors.blue,
    this.elevation = 4.0,
    this.centerTitle = true,
    this.actions,
    this.leading,
  });

  final String? title;
  final Color? backgroundColor;
  final double? elevation;
  final bool? centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? '',
        style:AppTextStyles.title(color: ColorManager.black, fontSize: AppSize.s20,fontWeight: FontWeight.w500),
      ),
      backgroundColor:  ColorManager.white,
      elevation: AppSize.s0,
      centerTitle: false,
      actions: actions,
      leading: leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
