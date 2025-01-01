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
import '../../features/auth/logout/data/contracts/logout_online_datasource.dart'
    as _i731;
import '../../features/auth/logout/data/data_sources/logout_online_datasource_impl.dart'
    as _i518;
import '../../features/auth/logout/data/repos/logout_repo_impl.dart' as _i977;
import '../../features/auth/logout/domain/repos/logout_repo.dart' as _i371;
import '../../features/auth/logout/domain/use_cases/logout_usecase.dart'
    as _i459;
import '../../features/auth/logout/presentation/logout_viewModel.dart' as _i795;
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
import '../../features/login/data/contracts/offline_data_source.dart' as _i459;
import '../../features/login/data/contracts/online_data_source.dart' as _i1047;
import '../../features/login/data/datasource/offline_data_source_impl.dart'
    as _i294;
import '../../features/login/data/datasource/online_data_source_impl.dart'
    as _i235;
import '../../features/login/data/repos/login_repo_impl.dart' as _i937;
import '../../features/login/domain/repos/login_repo.dart' as _i184;
import '../../features/login/domain/usecases/check_cached_user_use_case.dart'
    as _i788;
import '../../features/login/domain/usecases/get_cached_user_use_case.dart'
    as _i582;
import '../../features/login/domain/usecases/get_user_data_use_case.dart'
    as _i1;
import '../../features/login/domain/usecases/login_use_case.dart' as _i1005;
import '../../features/login/domain/usecases/set_cached_user_use_case.dart'
    as _i571;
import '../../features/login/presentation/cubit/login_viewmodel.dart' as _i821;
import '../../features/login/presentation/login_validator/login_validator.dart'
    as _i538;
import '../../features/on_boarding/presentation/on_boarding_view_model.dart'
    as _i484;
import '../local/hive/hive_manager.dart' as _i228;
import '../network/api_manager.dart' as _i119;
import '../network/network_module.dart' as _i200;
import '../providers/user_provider.dart' as _i26;

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
    gh.factory<_i26.UserProvider>(() => _i26.UserProvider());
    gh.factory<_i375.ForgetPasswordValidator>(
        () => _i375.ForgetPasswordValidator());
    gh.factory<_i826.UpdatePasswordValidator>(
        () => _i826.UpdatePasswordValidator());
    gh.factory<_i538.LoginValidator>(() => _i538.LoginValidator());
    gh.singleton<_i228.HiveManager>(() => _i228.HiveManager());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i459.OfflineDataSource>(
        () => _i294.OfflineDataSourceImpl(gh<_i228.HiveManager>()));
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager(
          gh<_i361.Dio>(),
          gh<_i26.UserProvider>(),
        ));
    gh.factory<_i267.ForgetPasswordOnlineDatasource>(
        () => _i460.ForgetPasswordOnlineDatasourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i974.ForgetPasswordRepository>(() =>
        _i584.ForgetPasswordRepositoryImpl(
            gh<_i267.ForgetPasswordOnlineDatasource>()));
    gh.factory<_i731.LogoutOnlineDatasource>(
        () => _i518.LogoutOnlineDatasourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i1047.OnlineDataSource>(
        () => _i235.OnlineDataSourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i154.UpdatePasswordOnlineDatasource>(
        () => _i1034.UpdatePasswordOnlineDatasourceImpl(
              gh<_i119.ApiManager>(),
              gh<_i26.UserProvider>(),
            ));
    gh.factory<_i184.LoginRepo>(() => _i937.LoginRepoImpl(
          gh<_i1047.OnlineDataSource>(),
          gh<_i459.OfflineDataSource>(),
        ));
    gh.factory<_i995.ForgetPasswordUsecase>(() =>
        _i995.ForgetPasswordUsecase(gh<_i974.ForgetPasswordRepository>()));
    gh.factory<_i923.UpdatePasswordRepository>(() =>
        _i411.UpdatePasswordRepositoryImpl(
            gh<_i154.UpdatePasswordOnlineDatasource>()));
    gh.factory<_i355.UpdatePasswordUseCase>(() =>
        _i355.UpdatePasswordUseCase(gh<_i923.UpdatePasswordRepository>()));
    gh.factory<_i371.LogoutRepo>(
        () => _i977.LogoutRpoImpl(gh<_i731.LogoutOnlineDatasource>()));
    gh.factory<_i459.LogoutUsecase>(
        () => _i459.LogoutUsecase(gh<_i371.LogoutRepo>()));
    gh.factory<_i833.UpdatePasswordViewModel>(
        () => _i833.UpdatePasswordViewModel(
              gh<_i355.UpdatePasswordUseCase>(),
              gh<_i826.UpdatePasswordValidator>(),
            ));
    gh.factory<_i788.CheckCachedUserUseCase>(
        () => _i788.CheckCachedUserUseCase(gh<_i184.LoginRepo>()));
    gh.factory<_i582.GetCachedUserUseCase>(
        () => _i582.GetCachedUserUseCase(gh<_i184.LoginRepo>()));
    gh.factory<_i1.GetUserDataUseCase>(
        () => _i1.GetUserDataUseCase(gh<_i184.LoginRepo>()));
    gh.factory<_i1005.LoginUseCase>(
        () => _i1005.LoginUseCase(gh<_i184.LoginRepo>()));
    gh.factory<_i571.SetCachedUserUseCase>(
        () => _i571.SetCachedUserUseCase(gh<_i184.LoginRepo>()));
    gh.factory<_i455.ForegetPasswordViewmodel>(
        () => _i455.ForegetPasswordViewmodel(
              gh<_i995.ForgetPasswordUsecase>(),
              gh<_i375.ForgetPasswordValidator>(),
            ));
    gh.factory<_i795.LogoutViewModel>(
        () => _i795.LogoutViewModel(gh<_i459.LogoutUsecase>()));
    gh.factory<_i484.OnBoardingViewModel>(() => _i484.OnBoardingViewModel(
          gh<_i788.CheckCachedUserUseCase>(),
          gh<_i582.GetCachedUserUseCase>(),
        ));
    gh.factory<_i821.LoginViewModel>(() => _i821.LoginViewModel(
          gh<_i1005.LoginUseCase>(),
          gh<_i571.SetCachedUserUseCase>(),
          gh<_i788.CheckCachedUserUseCase>(),
          gh<_i582.GetCachedUserUseCase>(),
          gh<_i1.GetUserDataUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i200.DioModule {}
