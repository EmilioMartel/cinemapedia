import 'package:cinemapedia/infrastructure/datasources/the_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_respository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// Este repositorio es de sólo lectura -> inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MovieDbDatasource() );
});