import 'package:cinemapedia/config/helpers/human_dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int day = now.day;
    String dayOfWeek = HumanDates.getDayOfWeek(now.weekday);

    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final slidesShowMovies = ref.watch( moviesSlideshowProvider );

    return Column(
      children: [
        const CustomAppbar(),

        MoviesSlideshow(movies: slidesShowMovies),

        MovieHorizontalListview(
          movies: nowPlayingMovies,
          title: 'Cines',
          subTitle: '$dayOfWeek $day',
        ),
      ],
    );
  }
}