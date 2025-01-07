import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? locationName;
  final String? locationUrl;
  final String? originName;
  final String? originUrl;
  final String? image;
  final List<String>? episode;
  final String? url;
  final String? created;
  final bool? isFavorite;

  const CharacterEntity({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.locationName,
    this.locationUrl,
    this.originName,
    this.originUrl,
    this.image,
    this.episode,
    this.url,
    this.created,
    this.isFavorite,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        locationName,
        locationUrl,
        originName,
        originUrl,
        image,
        episode,
        url,
        created,
        isFavorite,
      ];
}
