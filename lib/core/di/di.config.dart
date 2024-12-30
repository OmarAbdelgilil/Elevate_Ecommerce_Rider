// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/profile/data/contracts/get_profile_data_data_onlinedatasource.dart'
    as _i580;
import '../../features/auth/profile/data/data_sources/get_profile_data_onlinedatasourace_impl.dart'
    as _i207;
import '../../features/auth/profile/data/repos/get_profile_data_impl.dart'
    as _i225;
import '../../features/auth/profile/domain/repos/get_profile_data_repo.dart'
    as _i51;
import '../../features/auth/profile/domain/usecases/get_profile_data_usecase.dart'
    as _i898;
import '../../features/auth/profile/presentation/view_model/get_profile_data_view_model.dart'
    as _i222;
import '../network/api_manager.dart' as _i119;
import '../network/network_module.dart' as _i200;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i580.GetProfileDataOnlinedatasource>(() =>
        _i207.GetProfileDataOnlinedatasouraceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i51.GetProfileDataRepo>(() =>
        _i225.GetProfileDataImpl(gh<_i580.GetProfileDataOnlinedatasource>()));
    gh.factory<_i898.GetProfileDataUsecase>(
        () => _i898.GetProfileDataUsecase(gh<_i51.GetProfileDataRepo>()));
    gh.factory<_i222.ProfileCubit>(
        () => _i222.ProfileCubit(gh<_i898.GetProfileDataUsecase>()));
    return this;
  }
}

class _$DioModule extends _i200.DioModule {}
