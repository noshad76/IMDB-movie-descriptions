part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {}

class LoadMovie extends MovieEvent {
 final int id;
  LoadMovie(this.id);
  
  @override
  List<Object?> get props => [id];
}
