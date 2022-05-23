// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../app/data/network/services/product_service.dart' as _i4;
import '../../app/data/network/services/products_service.dart' as _i5;
import '../../app/data/repositories/product_repository.dart' as _i6;
import '../../app/notifiers/product_notifier.dart' as _i8;
import '../../app/notifiers/products_notifier.dart' as _i7;
import 'module_injector.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final moduleInjector = _$ModuleInjector();
  gh.lazySingleton<_i3.Dio>(() => moduleInjector.dio);
  gh.factory<_i4.ProductService>(() => _i4.ProductService(get<_i3.Dio>()));
  gh.factory<_i5.ProductsService>(() => _i5.ProductsService(get<_i3.Dio>()));
  gh.factory<_i6.ProductRepository>(() => _i6.ProductRepositoryImpl(
      get<_i5.ProductsService>(), get<_i4.ProductService>()));
  gh.factory<_i7.ProductsNotifier>(
      () => _i7.ProductsNotifier(get<_i6.ProductRepository>()));
  gh.factory<_i8.ProductNotifier>(
      () => _i8.ProductNotifier(get<_i6.ProductRepository>()));
  return get;
}

class _$ModuleInjector extends _i9.ModuleInjector {}
