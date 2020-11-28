import 'package:flutter/material.dart';
import 'package:movies/controllers/movie_controller.dart';
import 'package:movies/core/constants.dart';
import 'package:movies/pages/movie_datail_page.dart';
import 'package:movies/widgets/centered_message.dart';
import 'package:movies/widgets/centered_progress.dart';
import 'package:movies/widgets/movie_card.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final _controller = MovieController();
  final _scrollController = ScrollController();
  int lastPage = 1;
  int coluna = 2;

  @override
  void initState() {
    super.initState();
    _scrollInitListener();
    _initialize();
  }

  _scrollInitListener() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        if (_controller.currentPage == lastPage) {
          lastPage++;
          await _controller.fetchAllMovies(page: lastPage);
          setState(() {});
        }
      }
    });
  }

  _initialize() async {
    setState(() {
      _controller.loading = true;
    });

    await _controller.fetchAllMovies(page: lastPage);

    setState(() {
      _controller.loading = false;
    });
  }

  _changeListView() {
    coluna < 3 ? coluna = 3 : coluna = 2;
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildMovieGrip(),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(kAppName),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh),
          onPressed: _initialize,
        ),
        IconButton(
          icon: Icon(Icons.view_list),
          onPressed: _changeListView,
        ),
      ],
    );
  }

  _buildMovieGrip() {
    if (_controller.loading) {
      return CenteredProgress();
    }

    if (_controller.movieError != null) {
      return CenteredMessage(message: _controller.movieError.message);
    }

    return GridView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(10.0),
      itemCount: _controller.moviesCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: coluna,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        childAspectRatio: 0.65,
      ),
      itemBuilder: _buildMovieCard,
    );
  }

  Widget _buildMovieCard(context, index) {
    final movie = _controller.movies[index];
    return MovieCard(
      posterPath: movie.posterPath,
      onTap: () => _openDetailPage(movie.id),
    );
  }

  _openDetailPage(movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailPage(movieId),
      ),
    );
  }
}
//27-10 - 2:06 - git
