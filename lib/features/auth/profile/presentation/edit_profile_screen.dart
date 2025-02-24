import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/viewmodel/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/gender_selector.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_image.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    // Initialize text controllers
    final firstNameController =
        TextEditingController(text: user?.firstName ?? '');
    final lastNameController =
        TextEditingController(text: user?.lastName ?? '');
    final emailController = TextEditingController(text: user?.email ?? '');
    final phoneController = TextEditingController(text: user?.phone ?? '');
    final passwordController = TextEditingController(text: '********');

    // Use ValueNotifier for gender selection
    final ValueNotifier<String> genderNotifier =
        ValueNotifier(user?.gender ?? 'Male');

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Edit profile'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ProfileImage(imageUrl: user?.photo),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: 'First name',
                    hint: 'Enter first name',
                    controller: firstNameController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTextField(
                    label: 'Last name',
                    hint: 'Enter last name',
                    controller: lastNameController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Email',
              hint: 'Enter email',
              controller: emailController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Phone number',
              hint: 'Enter phone number',
              controller: phoneController,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              label: 'Password',
              hint: 'Enter password',
              controller: passwordController,
              suffix: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.ResetPassword);
                },
                child: const Text('Change'),
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<String>(
              valueListenable: genderNotifier,
              builder: (context, selectedGender, _) {
                return GenderSelector(
                  selectedGender: selectedGender,
                  onChanged: (value) => genderNotifier.value = value,
                );
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _handleUpdate(
                    context,
                    firstNameController,
                    lastNameController,
                    emailController,
                    phoneController,
                    genderNotifier.value),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Update'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleUpdate(
      BuildContext context,
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController emailController,
      TextEditingController phoneController,
      String gender) {
    final cubit = getIt<EditProfileCubit>();
    final intent = UpdateProfileIntent(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      phone: phoneController.text,
    );

    cubit.doIntent(intent);

    cubit.stream.listen((state) {
      if (state is EditProfileLoading) {
        // Optional loading state handling
      } else if (state is EditProfileSuccess) {
        context.read<UserProvider>().setUser(state.user);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      } else if (state is EditProfileError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.message)),
        );
      }
    });
  }
}
