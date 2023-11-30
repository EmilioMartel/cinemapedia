import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  
  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;
  
  return MoviesNotifier( fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallBack = Future<List<Movie>> Function({ int page });

class MoviesNotifier extends StateNotifier<List<Movie>>{

  int currentPage = 0;
  MovieCallBack fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies
  }): super([]); // se inicializa, el listado de movies vacío

  Future<void> loadNextPage() async {
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies( page: currentPage );
    state = [...state, ...movies];
  }

}