import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_driver/core/providers/location_provider.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/store.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/user.dart';
import 'package:elevate_ecommerce_driver/features/map/presentation/views/map_screen.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/open_phone_dialer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class UserAddressCard extends StatelessWidget {
  final User data;
  final bool showIcons;
  final Store storeData;
  bool inMap = false;
  UserAddressCard(
      {super.key,
      required this.data,
      required this.showIcons,
      required this.storeData,
      inMap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => data.lat == null ||
              data.long == null ||
              LocationProvider().positionStream == null ||
              inMap
          ? null
          : Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MapScreen(
                locationName: '${data.firstName!} ${data.lastName!}',
                locationImg: data.photo!,
                latitude: data.lat!,
                longitude: data.long!,
                userData: data,
                storeData: storeData,
              ),
            )),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: ColorManager.darkGrey,
                child: CachedNetworkImage(
                  imageUrl: data.photo!,
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
                      '${data.firstName!} ${data.lastName}',
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
                          openDialer(data.phone!);
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
                            openWhatsApp(data.phone!);
                          },
                          child:
                              SvgPicture.asset("assets/svg/whatsapp_icon.svg"))
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
