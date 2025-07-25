import 'package:equatable/equatable.dart';

class TagEntity extends Equatable {
  final String id;
  final String name;

  // todo add colorHex
  const TagEntity({required this.id, required this.name});

  TagEntity copyWith({String? id, String? name}) {
    return TagEntity(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
