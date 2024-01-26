import 'package:equatable/equatable.dart';
import 'package:movie_app/features/movies_feature/data/model/movie_list_model.dart';

class MovieListEntity extends Equatable {
 final List<Data>? data;
  final Metadata? metadata;

 const MovieListEntity({this.data, this.metadata});
  
  @override
  List<Object?> get props => [data,metadata];

 
}