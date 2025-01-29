import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_ecommerce_driver/features/auth/apply/data/models/responses/all_vehicles/VehicleResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/result.dart';
import '../../../../../../core/common/widgets/option_menu.dart';
import '../../../data/models/request/apply_request.dart';
import '../../../data/models/responses/ApplyResponse.dart';
import '../../../data/models/responses/all_vehicles/Vehicles.dart';
import '../../../domain_auth/usecases/apply_use_case.dart';
import '../../../domain_auth/usecases/get_allVehicles_use_case.dart';
import '../../base/base_cubit.dart';
import '../../base/base_states.dart';

@injectable
class ApplyViewModel extends BaseCubit implements ApplyViewModelInput, ApplyViewModelOutput {
  final ApplyUseCase _applyUseCase;
  final GetAllVehicleUseCase _allVehicleUseCase;

  ApplyViewModel(this._applyUseCase, this._allVehicleUseCase);

  static ApplyViewModel get(BuildContext context) => BlocProvider.of<ApplyViewModel>(context);

  String? _selectedCountryFlag;

  String? get selectedCountryFlag => _selectedCountryFlag;

  set setCountryFlag(String flagEmoji) {
    _selectedCountryFlag = flagEmoji;
    emit(ContentState());
  }

  String? _selectedGender;

  String? get selectedGender => _selectedGender;

  set setSelectedGender(String gender) {
    _selectedGender = gender;
    emit(ContentState());
  }

  get getCountryFlag => _selectedCountryFlag;
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleNumberController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController(text: '+2012951616');

  List<OptionMenuItem> menuItems = [];

  String? _selectedVehicleId;
  File? _nidImagePath;
  File? _vehicleLicenseImagePath;
  List<Vehicles> _vehiclesList = [];

  @override
  File? get getVehicleLicenseImagePath => _vehicleLicenseImagePath;

  @override
  File? get getNidImagePath => _nidImagePath;

  @override
  void start() {
    _countryController.text = "Egypt";
    _selectedCountryFlag = "🇪🇬";
    _fetchAllVehicles();
    emit(ContentState());
  }

  Future<void> applyWithFiles() async {
    emit(LoadingState());

    if (_vehicleLicenseImagePath == null || _nidImagePath == null) {
      emit(ErrorState("Both vehicle license and ID image must be provided."));
      return;
    }

    final validExtensions = ['png', 'jpg', 'jpeg'];
    final nidExtension = _nidImagePath!.path.split('.').last.toLowerCase();
    final licenseExtension = _vehicleLicenseImagePath!.path.split('.').last.toLowerCase();

    if (!validExtensions.contains(nidExtension) || !validExtensions.contains(licenseExtension)) {
      emit(ErrorState("Only PNG or JPG images are allowed."));
      return;
    }

    ApplyRequest request = ApplyRequest(
      country: _countryController.text,
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      vehicleType: _selectedVehicleId,
      vehicleNumber: _vehicleNumberController.text,
      nid: _nidController.text,
      email: _emailController.text,
      gender: _selectedGender,
      phone: _phoneController.text,
      password: _passwordController.text,
      rePassword: _rePasswordController.text,
      vehicleLicense: _vehicleLicenseImagePath,
      nIDImg: _nidImagePath,
    );

    try {
      final formData = await request.toFormData();

      print("FormData Fields: ${formData.fields}");
      print("FormData Files: ${formData.files}");

      final result = await _applyUseCase.applyWithFiles(formData);

      if (result is Success<ApplyResponse?>) {
        emit(SuccessState(result.data?.message ?? "Application Submitted"));
      } else if (result is Fail<ApplyResponse?>) {
        emit(ErrorState(result.data?.error??'An error occurred'));
      }
    } catch (e) {
      emit(ErrorState("An error occurred: $e"));
    }
  }

  Future<void> _fetchAllVehicles() async {
    emit(LoadingState());

    final result = await _allVehicleUseCase.getAllVehicles();
    if (result is Success<VehicleResponse?>) {
      final response = result.data;
      if (response != null && response.vehicles!.isNotEmpty) {
        _vehiclesList = response.vehicles!;

        menuItems = _vehiclesList.map((vehicle) {
          _selectedVehicleId = vehicle.id;
          return OptionMenuItem(
            icon: CachedNetworkImage(
              imageUrl: vehicle.image ?? '',
              width: 30,
              height: 30,
            ),
            text: vehicle.type ?? '',
            onPressed: () {
              _vehicleTypeController.text = vehicle.type!;
            },
          );
        }).toList();

        emit(ContentState());
      } else {
        emit(EmptyState(message: "No vehicles found"));
      }
    } else if (result is Fail) {
      emit(ErrorState(result.toString()));
    }
  }

  @override
  TextEditingController get getCountryController => _countryController;

  @override
  TextEditingController get getFirstNameController => _firstNameController;

  @override
  TextEditingController get getLastNameController => _lastNameController;

  @override
  TextEditingController get getVehicleTypeController => _vehicleTypeController;

  @override
  TextEditingController get getVehicleNumberController => _vehicleNumberController;

  @override
  TextEditingController get getNidController => _nidController;

  @override
  TextEditingController get getEmailController => _emailController;

  @override
  TextEditingController get getGenderController => _genderController;

  @override
  TextEditingController get getPasswordController => _passwordController;

  @override
  TextEditingController get getRePasswordController => _rePasswordController;

  @override
  TextEditingController get getPhoneController => _phoneController;

  @override
  set nidImage(File? file) {
    _nidImagePath = file;
    emit(ContentState());
  }

  @override
  set vehicleLicenseImage(File? file) {
    _vehicleLicenseImagePath = file;
    emit(ContentState());
  }

  @override
  set setImages(File images) {}

  @override
  String? get getSelectedVehicleId => _selectedVehicleId;
}
abstract class ApplyViewModelInput {
  set vehicleLicenseImage(File? file);

  set nidImage(File? file);

  set setImages(File images);
}

abstract class ApplyViewModelOutput {
  TextEditingController get getCountryController;
  TextEditingController get getFirstNameController;
  TextEditingController get getLastNameController;
  TextEditingController get getVehicleTypeController;
  TextEditingController get getVehicleNumberController;
  TextEditingController get getNidController;
  TextEditingController get getEmailController;
  TextEditingController get getGenderController;
  TextEditingController get getPasswordController;
  TextEditingController get getRePasswordController;
  TextEditingController get getPhoneController;

  File? get getVehicleLicenseImagePath;
  String? get getSelectedVehicleId;

  File? get getNidImagePath;
}