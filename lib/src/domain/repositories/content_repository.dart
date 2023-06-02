import 'package:dartz/dartz.dart';
import 'package:mbank_test/src/domain/entities/hero_entity.dart';
import 'package:mbank_test/src/domain/entities/response_entity.dart';
import 'package:mbank_test/src/domain/usecases/fetch_heroes.dart';
import '../../core/error/error/failure.dart';

abstract class ContentRepository {
  Future<Either<Failure, ResponseEntity<HeroEntity>>> fetchHeroes(
      PaginationParams params);
}
