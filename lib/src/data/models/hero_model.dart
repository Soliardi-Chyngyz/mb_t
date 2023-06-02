import '../../domain/entities/hero_entity.dart';

class HeroModel extends HeroEntity {
  const HeroModel({
    final int? id,
    final String? name,
    final String? status,
    final String? species,
    final String? type,
    final String? gender,
    final OriginModel? origin,
    final OriginModel? location,
    final String? image,
    final List<String>? episode,
    final String? url,
    final String? created,
  }) : super(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    origin: origin,
    location: location,
    image: image,
    episode: episode,
    url: url,
    created: created,
  );

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      type: json['type'],
      gender: json['gender'],
      origin:
      json['origin'] != null ? OriginModel.fromJson(json['origin']) : null,
      location: json['location'] != null
          ? OriginModel.fromJson(json['location'])
          : null,
      image: json['image'],
      episode: json['episode'].cast<String>(),
      url: json['url'],
      created: json['created'],
    );
  }
}

class OriginModel extends OriginEntity {
  const OriginModel({
    final String? name,
    final String? url,
  }) : super(
    name: name,
    url: url,
  );

  factory OriginModel.fromJson(Map<String, dynamic> json) => OriginModel(
    name: json['name'],
    url: json['url'],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
