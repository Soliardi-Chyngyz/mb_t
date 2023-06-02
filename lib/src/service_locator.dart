import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mbank_test/src/data/repositories/content_repository_impl.dart';
import 'package:mbank_test/src/domain/repositories/content_repository.dart';
import 'package:mbank_test/src/domain/usecases/fetch_heroes.dart';
import 'package:mbank_test/src/presentation/blocs/heroes_cubit.dart';

import 'common/api/api.dart';
import 'common/api/dio.dart';
import 'common/utils/platform/network_info.dart';
import 'data/datasources/remote_data_source.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Blocs
  sl.registerFactory(() => HeroesCubit(sl()));

  // UseCases
  sl.registerLazySingleton(() => FetchHeroes(sl()));

  // Repositories
  sl.registerLazySingleton<ContentRepository>(
    () => ContentRepositoryImpl(
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<RemoteDataSource>(
        () => RemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton(() => DioService());
  sl.registerLazySingleton(() => InternetConnectionChecker());

}
