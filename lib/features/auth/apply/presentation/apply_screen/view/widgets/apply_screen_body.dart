import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elevate_ecommerce_driver/core/common/validator/validator.dart';
import 'package:elevate_ecommerce_driver/utils/assets_manager.dart';
import 'package:elevate_ecommerce_driver/utils/color_manager.dart';
import 'package:elevate_ecommerce_driver/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../../core/common/widgets/main_text_field.dart';
import '../../../../../../../core/common/widgets/option_menu.dart';
import '../../../../../../../utils/custom_button.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(StringsManager.welcome.tr(),style: AppTextStyles.title(fontSize: 20,fontWeight: FontWeight.w500),),
              Text(StringsManager.applyMessage.tr(),style: AppTextStyles.title(fontSize: 16,fontWeight: FontWeight.w500,color: ColorManager.darkGrey),),
              Text(StringsManager.applyMessage2.tr(),style: AppTextStyles.title(fontSize: 16,fontWeight: FontWeight.w500,color: ColorManager.darkGrey),),

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
                      viewModel.setCountryFlag=country.flagEmoji;
                    },
                  );
                },
              ),
              MainTextField(
                textInputType: TextInputType.name,
                label: StringsManager.firstName.tr(),
                controller: viewModel.getFirstNameController,
                validation: AppValidators.validateName,
              ),
              MainTextField(
                textInputType: TextInputType.name,

                label: StringsManager.secondName.tr(),
                controller: viewModel.getLastNameController,
                validation: AppValidators.validateName,
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
                textInputType: TextInputType.number,

                label: StringsManager.vehicleNumber.tr(),
                controller: viewModel.getVehicleNumberController,
                validation:  AppValidators.validateNotEmpty,
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
                textInputType: TextInputType.emailAddress,

                label: StringsManager.email.tr(),
                controller: viewModel.getEmailController,
                validation: AppValidators.validateEmail,
              ),
              MainTextField(
                textInputType: TextInputType.phone,

                label: StringsManager.phoneNumber.tr(),
                controller: viewModel.getPhoneController,
                validation : (val) => AppValidators.validatePhoneNumber(val,viewModel.getCountryFlag),
              ),
              MainTextField(
                textInputType: TextInputType.number,

                label: StringsManager.idNumber.tr(),
                controller: viewModel.getNidController,
                validation: AppValidators.validateNotEmpty,
              ),
              FilePickerField(
                controlledFile: viewModel.getVehicleLicenseImagePath,
                placeholder: StringsManager.idImage.tr(),
                onFilePicked: (files) {
                  if (files != null) {
                    viewModel.vehicleLicenseImage = files;
                  }
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: MainTextField(
                      textInputType: TextInputType.text,
                      validation: AppValidators.validatePassword,
                      label: StringsManager.password.tr(),
                      controller: viewModel.getPasswordController,
                      isObscured: true,


                    ),
                  ),
                  const SizedBox(width: AppSize.s5),
                  Expanded(
                    child: MainTextField(
                      textInputType: TextInputType.text,
                      isObscured: true,
                      validation: (val) => AppValidators.validateConfirmPassword(
                        val,
                        viewModel.getPasswordController.text,
                      ),                      label: StringsManager.confirmPassword.tr(),
                      controller: viewModel.getRePasswordController,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s20),
              Row(
                children: [
                  Text(StringsManager.gender.tr()),
const Spacer(),
                  Row(
                    children: [
                      Radio<String>(
                        value: "male",
                        groupValue: viewModel.selectedGender,
                        onChanged: (value) {
                          viewModel.setSelectedGender = value!;
                        },
                      ),
                      Text(StringsManager.male.tr()),
                      Radio<String>(
                        value: "female",
                        groupValue: viewModel.selectedGender,
                        onChanged: (value) {
                          viewModel.setSelectedGender = value!;
                        },
                      ),
                      Text(StringsManager.female.tr()),
                    ],
                  ),
                ],
              ),
              CustomButton(
                text:StringsManager.continueApply,
                onPressed: () async {
                  if ((_formKey.currentState as FormState).validate()) {

                    return await viewModel.applyWithFiles();
                  }
                },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
