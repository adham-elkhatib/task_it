import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String id;
  final String name;

  // Optional future fields
  // final String colorHex;
  // final String? spaceId;
  // final String? createdBy;
  // final DateTime? createdAt;
  // final bool isShared;

  const TagEntity({
    required this.id,
    required this.name,
    // this.colorHex = '#000000',
    // this.spaceId,
    // this.createdBy,
    // this.createdAt,
    // this.isShared = false,
  });

  TagEntity copyWith({
    String? id,
    String? name,
    // String? colorHex,
    // String? spaceId,
    // String? createdBy,
    // DateTime? createdAt,
    // bool? isShared,
  }) {
    return TagEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      // colorHex: colorHex ?? this.colorHex,
      // spaceId: spaceId ?? this.spaceId,
      // createdBy: createdBy ?? this.createdBy,
      // createdAt: createdAt ?? this.createdAt,
      // isShared: isShared ?? this.isShared,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
