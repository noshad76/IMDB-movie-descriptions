import 'dart:convert';

import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';

class GenresListModel extends GenrelistEntitie {
  const GenresListModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory GenresListModel.fromMap(Map<String, dynamic> map) {
    return GenresListModel(
      id: map['id'].toInt() as int,
      name: map['name'] as String,
    );
  }

  factory GenresListModel.fromJson(String source) =>
      GenresListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
