import 'package:equatable/equatable.dart';

class HeroEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final OriginEntity? origin;
  final OriginEntity? location;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;

  const HeroEntity(
      {this.id,
        this.name,
        this.status,
        this.species,
        this.type,
        this.gender,
        this.origin,
        this.location,
        this.image,
        this.episode,
        this.url,
        this.created});

  @override
  List<Object?> get props => [
    id,
    name,
    status,
    episode,
    type,
    gender,
    origin,
    location,
    image,
    species,
    url,
    created,
  ];


}

class OriginEntity extends Equatable {
  final String? name;
  final String? url;

  const OriginEntity({this.name, this.url});

  @override
  List<Object?> get props => [name, url];
}