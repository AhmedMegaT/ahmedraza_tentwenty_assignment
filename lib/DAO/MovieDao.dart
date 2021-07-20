import 'package:ahmedraza_tentwenty_assignment/model/MovieModel.dart';
import 'package:floor/floor.dart';

@dao
abstract class MovieDao {
  @Query('SELECT * FROM Movie')
  Future<List<MovieModel>> findAllMovie();

  @Query('SELECT * FROM Movie WHERE id = :id')
  Stream<MovieModel?> findMovieById(int id);

  @insert
  Future<void> insertMovie(MovieModel movieModel);
}