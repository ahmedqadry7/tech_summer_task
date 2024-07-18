// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:http/http.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/repositories/product_repo.dart' as _i4;
import '../../domain/use_cases/get_products.dart' as _i6;
import '../../presentation/bloc/cubit.dart' as _i7;
import '../repositories/product_repo_impl.dart' as _i5;
import 'injection.dart' as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Client>(() => registerModule.client);
  gh.factory<_i4.ProductRepository>(
      () => _i5.ProductRepositoryImpl(get<_i3.Client>()));
  gh.factory<_i6.GetProducts>(
      () => _i6.GetProducts(get<_i4.ProductRepository>()));
  gh.factory<_i7.ProductCubit>(() => _i7.ProductCubit(get<_i6.GetProducts>()));
  return get;
}

class _$RegisterModule extends _i8.RegisterModule {}
