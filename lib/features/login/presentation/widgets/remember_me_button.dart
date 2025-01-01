import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';

class RememberMeCheckbox extends StatelessWidget {
  final ValueNotifier<bool> notifier;

  const RememberMeCheckbox({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: notifier,
          builder: (context, isChecked, _) {
            return Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                notifier.value = value ?? false;
              },
            );
          },
        ),
        Text(
          StringsManager.rememberMe.tr(),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
