import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/store.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/open_phone_dialer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreAddressCard extends StatelessWidget {
  final Store data;
  final bool showIcons;
  const StoreAddressCard(
      {super.key, required this.data, required this.showIcons});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: ColorManager.darkGrey,
              child: CachedNetworkImage(
                imageUrl: data.image!,
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  radius: 22,
                  backgroundImage: imageProvider,
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.person, color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    data.name!,
                    style: const TextStyle(color: ColorManager.darkGrey),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined),
                    SizedBox(
                      width: 200.w,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          maxLines: 1,
                          data.address ?? 'NA',
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            if (showIcons)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        openDialer(data.phoneNumber!);
                      },
                      child: Icon(
                        Icons.phone_outlined,
                        size: 20.sp,
                        color: ColorManager.pink,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                        onTap: () {
                          openWhatsApp(data.phoneNumber!);
                        },
                        child: SvgPicture.asset("assets/svg/whatsapp_icon.svg"))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
