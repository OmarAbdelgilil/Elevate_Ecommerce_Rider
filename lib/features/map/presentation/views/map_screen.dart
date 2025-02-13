import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/store.dart';
import 'package:elevate_ecommerce_driver/features/home/domain/models/orders/user.dart';
import 'package:elevate_ecommerce_driver/features/map/presentation/viewmodels/map_screen_view_model.dart';
import 'package:elevate_ecommerce_driver/features/map/presentation/views/contacts_bottom_modal_sheet.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String locationName;
  final String locationImg;
  final Store storeData;
  final User userData;

  const MapScreen({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.locationName,
    required this.locationImg,
    required this.storeData,
    required this.userData,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<MapScreenViewModel>();
    viewModel.doIntent(LoadMap(widget.locationName, widget.locationImg,
        widget.longitude, widget.latitude));
    showContactsBottomSheet(
      context,
      widget.storeData,
      widget.userData,
    );
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocProvider.value(
            value: viewModel,
            child: BlocBuilder<MapScreenViewModel, MapScreenState>(
              builder: (context, state) {
                if (state is MapLoadingState || state is MapInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }
                return GoogleMap(
                  style: viewModel.mapStyle,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(widget.latitude, widget.longitude),
                    zoom: 12,
                  ),
                  polylines: viewModel.polylines,
                  markers: {
                    Marker(
                      markerId: const MarkerId('dest'),
                      position: LatLng(widget.latitude, widget.longitude),
                      icon: viewModel.destMarker!,
                    ),
                    Marker(
                      markerId: const MarkerId('loc'),
                      position:
                          LatLng(viewModel.driverLat, viewModel.driverLong),
                      icon: viewModel.driverMarker!,
                    )
                  },
                );
              },
            ),
          ),
          Positioned(
            top: 60,
            left: 16,
            child: CircleAvatar(
              backgroundColor: ColorManager.primary,
              radius: 24,
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: ColorManager.primary,
              radius: 28,
              child: IconButton(
                icon: const Icon(Icons.contacts, color: Colors.white),
                onPressed: () {
                  showContactsBottomSheet(
                    context,
                    widget.storeData,
                    widget.userData,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
