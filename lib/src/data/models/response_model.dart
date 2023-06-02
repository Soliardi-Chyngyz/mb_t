import '../../domain/entities/response_entity.dart';
import 'hero_model.dart';

class ResponseModel<T> extends ResponseEntity<T> {
  const ResponseModel({
    required final InfoModel info,
    required final List<T> results,
  }) : super(
          info: info,
          results: results,
        );

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    List<T> results = [];

    if (T == HeroModel) {
      json['results'].forEach((v) {
        results.add(HeroModel.fromJson(v) as T);
      });
    }

    return ResponseModel(
      info: InfoModel.fromJson(json['info']),
      results: results,
    );
  }
}

class InfoModel extends InfoEntity {
  const InfoModel({
    final int? count,
    final int? pages,
    final String? next,
    final String? prev,
  }) : super(
          count: count,
          pages: pages,
          next: next,
          prev: prev,
        );

  factory InfoModel.fromJson(Map<String, dynamic> json) => InfoModel(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    data['prev'] = prev;
    return data;
  }
}
