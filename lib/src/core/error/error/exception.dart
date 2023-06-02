class ServerException implements Exception {
  final String? errorMessage;
  ServerException({this.errorMessage});
}

class CacheException implements Exception {
  CacheException({this.messageError, this.status});

  final String? messageError;
  final int? status;
}
