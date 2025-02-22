import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/custom_drop_down.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<Map<String, String>> vehicles = [
  {
    "_id": "676b63c99f3884b3405c149b",
    "type": "Motor Cycle",
  },
  {
    "_id": "676b63ef9f3884b3405c14a5",
    "type": "Compact",
  },
  {
    "_id": "676b63fc9f3884b3405c14ad",
    "type": "Sedan",
  },
  {
    "_id": "676b640e9f3884b3405c14b5",
    "type": "Semi",
  },
  {
    "_id": "676b641c9f3884b3405c14bd",
    "type": "Sports",
  },
  {
    "_id": "676b64279f3884b3405c14c5",
    "type": "SUV",
  },
  {
    "_id": "676b64349f3884b3405c14cd",
    "type": "Truck",
  },
];

class EditVehicleScreen extends StatelessWidget {
  const EditVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final user = userProvider.user;

        if (user == null) {
          return const Center(child: Text(StringsManager.noUserDataAvailable));
        }

        // Initialize controllers with user data
        final vehicleNumberController =
            TextEditingController(text: user.vehicleNumber);
        final vehicleLicenseController =
            TextEditingController(text: user.vehicleLicense);

        // Extract vehicle types for dropdown
        final vehicleTypes =
            vehicles.map((vehicle) => vehicle["type"]!).toList();

        // Ensure we have a valid vehicle type
        String selectedVehicleType = user.vehicleType ?? vehicleTypes.first;

        // Check if selectedVehicleType exists in vehicleTypes
        if (!vehicleTypes.contains(selectedVehicleType)) {
          selectedVehicleType = vehicleTypes.first; // Fallback to first item
        }

        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text(StringsManager.editVehicle),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomDropdown(
                  label: StringsManager.vehicleType,
                  value: selectedVehicleType,
                  items: vehicleTypes,
                  onChanged: (value) {
                    // Handle value change
                    // Update the user's vehicle type in provider if needed
                    userProvider.setUser(user..vehicleType = value);
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: StringsManager.vehicleNumber,
                  hint: StringsManager.enterVehicleNumber,
                  controller: vehicleNumberController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: StringsManager.vehicleLicense,
                  suffix: IconButton(
                    icon: const Icon(Icons.file_upload_outlined),
                    onPressed: () {},
                  ),
                  hint: StringsManager.enterVehicleLicense,
                  controller: vehicleLicenseController,
                ),
                const Spacer(),
                CustomButton(
                  color: Colors.grey,
                  fontColor: Colors.white,
                  onPressed: () {
                    // Handle update action here
                    userProvider.setUser(user);
                    Navigator.pop(context); // Navigate back after updating
                  },
                  text: StringsManager.update,
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
