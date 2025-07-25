import 'package:equatable/equatable.dart';

class LabelEntity extends Equatable {
  final String id;
  final String name;
  final String colorHex;

  const LabelEntity({
    required this.id,
    required this.name,
    required this.colorHex,
  });

  LabelEntity copyWith({String? id, String? name, String? colorHex}) {
    return LabelEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      colorHex: colorHex ?? this.colorHex,
    );
  }

  @override
  List<Object?> get props => [id, name, colorHex];
}
