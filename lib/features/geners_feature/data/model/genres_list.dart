import 'dart:convert';

import 'package:movie_app/features/geners_feature/domain/entities/genres_list_entitie.dart';

class GenresListModel extends GenrelistEntitie {
  const GenresListModel({
    required int id,
    required String name,
  }) : super(id: id, name: name);

  factory GenresListModel.fromMap(Map<String, dynamic> map) {
    return GenresListModel(
      id: map['id'],
      name: map['name'],
    );
  }

  static List<GenresListModel> fromJson(List<dynamic> source) {
    
    return source.map((e) => GenresListModel.fromMap(e)).toList();
  }
  // GenresListModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
