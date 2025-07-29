import 'package:equatable/equatable.dart';

class LabelEntity extends Equatable {
  final String id;
  final String name;
  final String colorHex;

  // Optional future fields
  // final String? spaceId;
  // final bool isFavorite;
  // final String? createdBy;
  // final DateTime? createdAt;

  const LabelEntity({
    required this.id,
    required this.name,
    required this.colorHex,
    // this.spaceId,
    // this.isFavorite = false,
    // this.createdBy,
    // this.createdAt,
  });

  LabelEntity copyWith({
    String? id,
    String? name,
    String? colorHex,
    // String? spaceId,
    // bool? isFavorite,
    // String? createdBy,
    // DateTime? createdAt,
  }) {
    return LabelEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
      // spaceId: spaceId ?? this.spaceId,
      // isFavorite: isFavorite ?? this.isFavorite,
      // createdBy: createdBy ?? this.createdBy,
      // createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [id, name, colorHex];
}
