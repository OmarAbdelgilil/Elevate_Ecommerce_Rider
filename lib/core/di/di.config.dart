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

import '../../features/home/data/contracts/offline_data_source.dart' as _i842;
import '../../features/home/data/contracts/online_data_source.dart' as _i89;
import '../../features/home/data/datasource/offline_data_source_impl.dart'
    as _i902;
import '../../features/home/data/datasource/online_data_source_impl.dart'
    as _i1015;
import '../../features/home/data/repositories/home_repository_impl.dart'
    as _i76;
import '../../features/home/domain/repositories/home_repository.dart' as _i0;
import '../../features/home/domain/usecases/check_order_use_case.dart' as _i2;
import '../../features/home/domain/usecases/get_pending_orders_use_case.dart'
    as _i346;
import '../../features/home/domain/usecases/set_order_use_case.dart' as _i234;
import '../../features/home/presentation/viewmodels/home_view_model.dart'
    as _i514;
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
    gh.factory<_i538.LoginValidator>(() => _i538.LoginValidator());
    gh.singleton<_i228.HiveManager>(() => _i228.HiveManager());
    gh.lazySingleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i459.OfflineDataSource>(
        () => _i294.OfflineDataSourceImpl(gh<_i228.HiveManager>()));
    gh.factory<_i842.OfflineDataSource>(
        () => _i902.OfflineDataSourceImpl(gh<_i228.HiveManager>()));
    gh.singleton<_i119.ApiManager>(() => _i119.ApiManager(
          gh<_i361.Dio>(),
          gh<_i26.UserProvider>(),
        ));
    gh.factory<_i89.OnlineDataSource>(
        () => _i1015.OnlineDataSourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i1047.OnlineDataSource>(
        () => _i235.OnlineDataSourceImpl(gh<_i119.ApiManager>()));
    gh.factory<_i184.LoginRepo>(() => _i937.LoginRepoImpl(
          gh<_i1047.OnlineDataSource>(),
          gh<_i459.OfflineDataSource>(),
        ));
    gh.factory<_i0.HomeRepository>(() => _i76.HomeRepositoryImpl(
          gh<_i89.OnlineDataSource>(),
          gh<_i842.OfflineDataSource>(),
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
    gh.factory<_i346.GetPendingOrdersUseCase>(
        () => _i346.GetPendingOrdersUseCase(gh<_i0.HomeRepository>()));
    gh.factory<_i2.CheckOrderUseCase>(
        () => _i2.CheckOrderUseCase(gh<_i0.HomeRepository>()));
    gh.factory<_i234.SetOrderUseCase>(
        () => _i234.SetOrderUseCase(gh<_i0.HomeRepository>()));
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
    gh.lazySingleton<_i514.HomeViewModel>(() => _i514.HomeViewModel(
          gh<_i346.GetPendingOrdersUseCase>(),
          gh<_i2.CheckOrderUseCase>(),
          gh<_i234.SetOrderUseCase>(),
        ));
    return this;
  }
}

class _$DioModule extends _i200.DioModule {}
