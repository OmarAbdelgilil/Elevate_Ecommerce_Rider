import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/text_style.dart';
import '../../../utils/values_manager.dart';


class OptionMenuItem {
  final Widget icon;
  final String text;
  final Function onPressed;

  OptionMenuItem({
    required this.icon,
    required this.text,
    required this.onPressed,
  });
}

class OptionMenu extends StatelessWidget {
  const OptionMenu({
    super.key,
    required this.items,
    required this.mainIcon,
  });

  final Widget mainIcon;
  final List<OptionMenuItem> items;

  List<PopupMenuEntry> buildOptions(BuildContext context, List<OptionMenuItem> items) {
    List<PopupMenuEntry> list = [];
    for (OptionMenuItem item in items) {
      list.add(
        PopupMenuItem(
          onTap: () {
            item.onPressed();
          },
          child: Row(
            children: [
              item.icon,
              const SizedBox(width: AppSize.s10),
              Text(
                item.text,
                style: AppTextStyles.subtitle(),
              ),
            ],
          ),
        ),
      );
      list.add(const PopupMenuDivider(height: AppSize.s1));
    }
    list.removeLast();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon:mainIcon,
      color: ColorManager.white,
      iconColor: ColorManager.black,
      offset: const Offset(-AppSize.s50, AppSize.s0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s10),
      ),
      itemBuilder: (context) => buildOptions(context, items),
    );
  }
}
