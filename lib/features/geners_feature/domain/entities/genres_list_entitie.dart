import 'package:equatable/equatable.dart';

class GenrelistEntitie extends Equatable {
  final int id;
  final String name;
  const GenrelistEntitie({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
