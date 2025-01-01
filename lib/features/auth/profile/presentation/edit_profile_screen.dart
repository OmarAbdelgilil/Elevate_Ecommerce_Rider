import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/viewmodel/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/gender_selector.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_image.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  String gender = 'Male';

  @override
  void initState() {
    super.initState();
    final user = context.read<UserProvider>().user;
    firstNameController = TextEditingController(text: user?.firstName ?? '');
    lastNameController = TextEditingController(text: user?.lastName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    phoneController = TextEditingController(text: user?.phone ?? '');
    passwordController = TextEditingController(text: '********');
    gender = user?.gender ?? 'Male';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

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
              obscureText: true,
              suffix: TextButton(
                onPressed: () {
                  // Handle password change
                },
                child: const Text('Change'),
              ),
            ),
            const SizedBox(height: 16),
            GenderSelector(
              selectedGender: gender,
              onChanged: (value) => setState(() => gender = value),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleUpdate,
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

  void _handleUpdate() {
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
