import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/viewmodel/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/gender_selector.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_image.dart';
import 'package:elevate_ecommerce_driver/utils/custom_textfield.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final cubit = getIt<EditProfileCubit>();

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

    return BlocListener<EditProfileCubit, EditProfileState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          context.read<UserProvider>().setUser(state.user);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(StringsManager.profileUpdatedSuccessfully)),
          );
        } else if (state is ImageUploadSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text(StringsManager.profileImageUpdatedSuccessfully)),
          );
        } else if (state is EditProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
          print(state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(StringsManager.editProfile),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProfileImage(
                imageUrl: user?.photo,
                onImageSelected: (File image) {
                  cubit.doIntent(UploadImageIntent(imageFile: image));
                },
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: StringsManager.firstName,
                      hint: StringsManager.enterFirstName,
                      controller: firstNameController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: StringsManager.lastName,
                      hint: StringsManager.enterLastName,
                      controller: lastNameController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: StringsManager.email,
                hint: StringsManager.enterEmail,
                controller: emailController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: StringsManager.phoneNumber,
                hint: StringsManager.enterPhoneNumber,
                controller: phoneController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                label: StringsManager.pass,
                hint: StringsManager.enterPass,
                controller: passwordController,
                suffix: TextButton(
                  onPressed: () {
                    // Handle password change
                  },
                  child: const Text(StringsManager.changePassword),
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
              BlocBuilder<EditProfileCubit, EditProfileState>(
                bloc: cubit,
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state is EditProfileLoading
                          ? null
                          : () => _handleUpdate(
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
                      child: state is EditProfileLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(StringsManager.update),
                    ),
                  );
                },
              ),
            ],
          ),
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
  }
}
