import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/custom_drop_down.dart';
import 'package:elevate_ecommerce_driver/utils/custom_button.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:flutter/material.dart';

class EditVehicleScreen extends StatelessWidget {
  const EditVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit profile'),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomDropdown(
              label: "Vehicle type",
              value: "Bike",
              items: const ["Bike", "Car", "Truck"],
              onChanged: (value) {
                // Handle value change
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Vehicle number',
              hint: 'Enter vehicle number',
              controller: TextEditingController(),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Vehicle license',
              suffix: IconButton(
                icon: const Icon(Icons.file_upload_outlined),
                onPressed: () {},
              ),
              hint: ' Enter vehicle license ',
              controller: TextEditingController(),
            ),
            const Spacer(),
            CustomButton(
              onPressed: () {},
              text: 'Update',
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
