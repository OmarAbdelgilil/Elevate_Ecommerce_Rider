import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:flutter/material.dart';

class LocationPermissionScreen extends StatelessWidget {
  const LocationPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Location permission required"),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButton(
              text: 'Try again',
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.boarding, (Route route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}
