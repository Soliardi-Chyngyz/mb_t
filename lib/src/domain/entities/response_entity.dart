import 'package:equatable/equatable.dart';

class ResponseEntity<T> extends Equatable {
  final InfoEntity info;
  final List<T> results;

  const ResponseEntity({
    required this.info,
    required this.results,
  });

  @override
  List<Object?> get props => [info, results];
}

class InfoEntity extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const InfoEntity({this.count, this.pages, this.next, this.prev});

  @override
  List<Object?> get props => [
    count,
    pages,
    next,
    prev,
  ];
}