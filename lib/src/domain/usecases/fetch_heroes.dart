import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mbank_test/src/core/error/error/failure.dart';
import 'package:mbank_test/src/domain/entities/response_entity.dart';
import 'package:mbank_test/src/domain/repositories/content_repository.dart';
import '../../core/usecases/usecase.dart';
import '../entities/hero_entity.dart';

class FetchHeroes extends UseCase<ResponseEntity<HeroEntity>, PaginationParams> {
  FetchHeroes(this.repository);

  final ContentRepository repository;

  @override
  Future<Either<Failure, ResponseEntity<HeroEntity>>> call(
      PaginationParams params) =>
      repository.fetchHeroes(params);
}

class PaginationParams extends Equatable {
  const PaginationParams(this.page);
  final String? page;

  @override
  List<Object?> get props => [page];
}

class DefaultParams {
  DefaultParams();
}
