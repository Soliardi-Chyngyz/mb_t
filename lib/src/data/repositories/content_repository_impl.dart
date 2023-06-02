import 'package:dartz/dartz.dart';
import 'package:mbank_test/src/core/error/error/failure.dart';
import 'package:mbank_test/src/data/datasources/remote_data_source.dart';
import 'package:mbank_test/src/domain/entities/hero_entity.dart';
import 'package:mbank_test/src/domain/entities/response_entity.dart';
import 'package:mbank_test/src/domain/usecases/fetch_heroes.dart';
import '../../common/utils/platform/network_info.dart';
import '../../core/error/error/exception.dart';
import '../../domain/repositories/content_repository.dart';

class ContentRepositoryImpl extends ContentRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ContentRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ResponseEntity<HeroEntity>>> fetchHeroes(
      PaginationParams params) async {
    if (await networkInfo.isConnected) {
      try {
        return Right((await remoteDataSource.fetchHeroes(params))
            as ResponseEntity<HeroEntity>);
      } on ServerException catch (e) {
        return Left(ServerFailure(
          errorMessage: e.errorMessage,
        ));
      } on CacheException catch (e) {
        return Left(CacheFailure(
          e.messageError,
        ));
      }
    } else {
      return const Left(ServerFailure());
    }
  }
}
