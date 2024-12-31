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

import '../../features/auth/forget_password/data/contracts/forget_password_online_datasource.dart'
    as _i267;
import '../../features/auth/forget_password/data/data_sources/forget_password_online_datasource_impl.dart'
    as _i460;
import '../../features/auth/forget_password/data/repositories/forget_password_repository_impl.dart'
    as _i584;
import '../../features/auth/forget_password/domain/repositories/forget_password_repository.dart'
    as _i974;
import '../../features/auth/forget_password/domain/usecases/forget_password_usecase.dart'
    as _i995;
import '../../features/auth/forget_password/presentation/foreget_password_viewmodel.dart'
    as _i455;
import '../../features/auth/forget_password/presentation/forget_password_validator/forget_password_validator.dart'
    as _i375;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDatasource.dart'
    as _i154;
import '../../features/auth/update_password/data/dataSource/updatePassword_OnlineDataSourse_impl.dart'
    as _i1034;
import '../../features/auth/update_password/data/repository_impl/updatePassword_repository_impl.dart'
    as _i411;
import '../../features/auth/update_password/domain/repository/update_password_repository.dart'
    as _i923;
import '../../features/auth/update_password/domain/useCases/update_password_useCase.dart'
    as _i355;
import '../../features/auth/update_password/presentation/Update_password_validator/update_password_validator.dart'
    as _i826;
import '../../features/auth/update_password/presentation/UpdatePassword_ViewModel/updatePassword_ViewModel.dart'
    as _i833;
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
    gh.factory<_i375.ForgetPasswordValidator>(
        () => _i375.ForgetPasswordValidator());
    gh.factory<_i826.UpdatePasswordValidator>(
        () => _i826.UpdatePasswordValidator());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager(gh<_i361.Dio>()));
    gh.factory<_i154.UpdatePasswordOnlineDatasource>(() =>
        _i1034.UpdatePasswordOnlineDatasourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i267.ForgetPasswordOnlineDatasource>(
        () => _i460.ForgetPasswordOnlineDatasourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i923.UpdatePasswordRepository>(() =>
        _i411.UpdatePasswordRepositoryImpl(
            gh<_i154.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i355.UpdatePasswordUseCase>(() =>
        _i355.UpdatePasswordUseCase(gh<_i923.UpdatePasswordRepository>()));
    gh.factory<_i833.UpdatePasswordViewModel>(
        () => _i833.UpdatePasswordViewModel(
              gh<_i355.UpdatePasswordUseCase>(),
              gh<_i826.UpdatePasswordValidator>(),
            ));
    gh.factory<_i974.ForgetPasswordRepository>(() =>
        _i584.ForgetPasswordRepositoryImpl(
            gh<_i267.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i974.ForgetPasswordRepository>()));
    gh.factory<_i455.ForegetPasswordViewmodel>(
        () => _i455.ForegetPasswordViewmodel(
              gh<_i995.ForgetPasswordUsecase>(),
              gh<_i375.ForgetPasswordValidator>(),
            ));
    return this;
  }
}

class _$DioModule extends _i200.DioModule {}
