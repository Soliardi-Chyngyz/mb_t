import 'package:dio/dio.dart';
import 'package:mbank_test/src/data/models/hero_model.dart';
import 'package:mbank_test/src/data/models/response_model.dart';
import 'package:mbank_test/src/domain/usecases/fetch_heroes.dart';
import '../../common/api/dio.dart';
import '../../common/constants.dart';
import '../../core/error/error/exception.dart';

abstract class RemoteDataSource {
  Future<ResponseModel> fetchHeroes(PaginationParams params);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl(this.dioService);

  final DioService dioService;

  @override
  Future<ResponseModel> fetchHeroes(PaginationParams params) async {
    final response =
        dioService.get(endPoint: params.page ?? '$endpoint/character');
    return _request<HeroModel>(response!);
  }

  Future<ResponseModel> _request<T>(Future<dynamic> method) async {
    try {
      final response = await method.timeout(
        Duration(milliseconds: httpStatusCode.connectTimeout),
        onTimeout: () =>
            throw ServerException(errorMessage: 'Please try letter, time out'),
      );
      if ((response as Response).statusCode == 200) {
        return ResponseModel<T>.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode != null
          ? e.response!.statusCode! >= 500
          : 500 >= 500) {
        throw ServerException();
      } else {
        throw CacheException(messageError: e.error);
      }
    }
    throw ServerException();
  }
}
