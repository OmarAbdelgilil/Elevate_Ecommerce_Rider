import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/common/validator/validator.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../core/common/widgets/main_text_field.dart';
import '../../../../../../../core/common/widgets/option_menu.dart';
import '../../../../../../../utils/strings_manager.dart';
import '../../../../../../../utils/values_manager.dart';
import '../../view_model/apply_viewmodel.dart';
import 'filed_picker.dart';

class ApplyScreenBody extends StatelessWidget {
  final ApplyViewModel viewModel;

  static final GlobalKey _formKey = GlobalKey<FormState>();
   const ApplyScreenBody({super.key, required this.viewModel});


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: AppSize.s20,
            children: [
              MainTextField(
                label: StringsManager.country.tr(),
                readOnly: true,
                controller: viewModel.getCountryController,
                validation: AppValidators.validateNotEmpty,
                customPrefixIcon: viewModel.selectedCountryFlag != null
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    viewModel.selectedCountryFlag!,
                    style: const TextStyle(fontSize: 24),
                  ),
                )
                    : null,
                onTap: () {
                  showCountryPicker(
                    context: context,
                    useSafeArea: true,

                    showPhoneCode: true,
                    onSelect: (Country country) {
                      viewModel.getCountryController.text = country.name;
                      viewModel.setCountryFlag(country.flagEmoji);
                    },
                  );
                },
              ),
              MainTextField(
                label: StringsManager.firstName.tr(),
                controller: viewModel.getFirstNameController,
                validation: AppValidators.validateNotEmpty,
              ),
              MainTextField(
                label: StringsManager.secondName.tr(),
                controller: viewModel.getLastNameController,
                validation: AppValidators.validateNotEmpty,
              ),

              MainTextField(
                label: StringsManager.vehicleType.tr(),
                controller: viewModel.getVehicleTypeController,
                validation: AppValidators.validateNotEmpty,
                readOnly: true,
                customSuffixIcon: OptionMenu(
                  mainIcon: SvgPicture.asset(SVGAssets.menu),
                  items: viewModel.menuItems,
                ),

              ),

              MainTextField(
                label: StringsManager.vehicleNumber.tr(),
                controller: viewModel.getVehicleNumberController,
                validation: AppValidators.validateNotEmpty,
              ),
              FilePickerField(
                controlledFile: viewModel.getNidImagePath,
                placeholder: StringsManager.vehicleImage.tr(),
                onFilePicked: (files) {
                  if (files != null) {
                    viewModel.nidImage = files;
                  }
                },
              ),
              MainTextField(
                label: StringsManager.email.tr(),
                controller: viewModel.getEmailController,
                validation: AppValidators.validateEmail,
              ),
              MainTextField(
                label: StringsManager.phoneNumber.tr(),
                controller: viewModel.getPhoneController,
                validation: AppValidators.validateNotEmpty,
              ),
              MainTextField(
                label: StringsManager.idNumber.tr(),
                controller: viewModel.getNidController,
                validation: AppValidators.validateNotEmpty,
              ),
              MainTextField(
                label: StringsManager.gender.tr(),
                controller: viewModel.getGenderController,
                validation: AppValidators.validateNotEmpty,
              ),
              FilePickerField(
                controlledFile: viewModel.getVehicleLicenseImagePath,
                placeholder: StringsManager.idImage.tr(),
                onFilePicked: (files) {
                  if (files != null) {
                    viewModel.vehicleLicenseImage = files;
                    print('-----------------------');
                    print(files.length);
                    print(files.toString());
                    log(files.toString());
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: MainTextField(
                      validation: AppValidators.validateNotEmpty,
                      label: StringsManager.password.tr(),
                      controller: viewModel.getPasswordController,
                    ),
                  ),
                  const SizedBox(width: AppSize.s5),
                  Expanded(
                    child: MainTextField(
                      label: StringsManager.confirmPassword.tr(),
                      controller: viewModel.getRePasswordController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              ElevatedButton(
                onPressed: () async {
                  if ((_formKey.currentState as FormState).validate()) {

                    return await viewModel.applyWithFiles();
                  }
                },
                child: const Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
