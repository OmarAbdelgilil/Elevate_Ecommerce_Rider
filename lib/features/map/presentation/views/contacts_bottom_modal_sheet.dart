import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/store.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/user.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/store_address_card.dart';
import 'package:elevate_ecommerce_driver/features/home/presentation/home_screen/views/widgets/user_address_card.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';

showContactsBottomSheet(BuildContext context, Store storeData, User userData) {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.transparent,
      showDragHandle: true,
      builder: (context) {
        return SizedBox(
          width: double.infinity,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringsManager.pickupAddress.tr(),
                  style: const TextStyle(color: ColorManager.darkGrey),
                ),
                StoreAddressCard(
                  userData: userData,
                  data: storeData,
                  showIcons: true,
                  inMap: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  StringsManager.userAddress.tr(),
                  style: const TextStyle(color: ColorManager.darkGrey),
                ),
                UserAddressCard(
                  data: userData,
                  showIcons: true,
                  storeData: storeData,
                  inMap: true,
                ),
              ],
            ),
          ),
        );
      },
    );
  });
}
