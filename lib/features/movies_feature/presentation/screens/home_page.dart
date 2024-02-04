import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genre_list_bloc/genre_bloc.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/movie_list_by_genre_bloc/bloc/movie_list_by_genre_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/genre_chips.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/home_page_appbar.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/movie_card_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedGenere = 0;
  int currentPage = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<GenreBloc, GenreListState>(
      builder: (context, genreListstate) {
        return DefaultTabController(
          length: genreListstate is GenreListLoaded
              ? BlocProvider.of<GenreBloc>(context)
                      .state
                      .genrelistEntitie!
                      .length +
                  1
              : 4,
          initialIndex: 0,
          child: BlocBuilder<MovieListByGenreBloc, MovieListByGenreState>(
            builder: (context, movieByGenreState) {
              return Scaffold(
                body: CustomScrollView(
                  slivers: [
                    HomePageAppBar(height: height),
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Divider(
                            thickness: 3,
                            color: Palete.white,
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          BlocBuilder<GenreBloc, GenreListState>(
                            builder: (context, state) {
                              if (state is GenreListLoading) {
                                return TabBar(
                                  dividerHeight: 0,
                                  indicatorColor: Colors.transparent,
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  labelPadding: const EdgeInsets.only(left: 10),
                                  onTap: (value) {
                                    setState(() {
                                      selectedGenere = value;
                                    });
                                  },
                                  tabs: List.generate(
                                    4,
                                    (index) => GenreChips(
                                        genre: 'loading',
                                        index: index,
                                        height: height,
                                        width: width,
                                        selectedGenere: selectedGenere),
                                  ),
                                );
                              } else if (state is GenreListLoaded) {
                                return TabBar(
                                  dividerHeight: 0,
                                  indicatorColor: Colors.transparent,
                                  isScrollable: true,
                                  tabAlignment: TabAlignment.start,
                                  labelPadding: const EdgeInsets.only(left: 10),
                                  onTap: (value) {
                                    setState(() {
                                      selectedGenere = value;
                                      currentPage = 1;
                                    });
                                    if (selectedGenere != 0) {
                                      BlocProvider.of<MovieListByGenreBloc>(
                                              context)
                                          .add(LoadMovieListByGenreEvent(
                                              page: 1,
                                              genreId: selectedGenere));
                                    }
                                  },
                                  tabs: List.generate(
                                    state.genrelistEntitie!.length + 1,
                                    (index) => GenreChips(
                                        genre: index == 0
                                            ? 'All'
                                            : state.genrelistEntitie![index - 1]
                                                .name,
                                        index: index,
                                        height: height,
                                        width: width,
                                        selectedGenere: selectedGenere),
                                  ),
                                );
                              } else {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                            },
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                        ],
                      ),
                    ),
                    BlocBuilder<MovieListBloc, MovieListState>(
                      builder: (context, state) {
                        if (selectedGenere == 0) {
                          if (state is MovieListLoading) {
                            return const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else if (state is MovieListLoaded) {
                            return MovieCardsGridView(
                              height: height,
                              movieListByGenreEntitie: null,
                              movieListEntity: state.movieListEntity,
                            );
                          } else {
                            return const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        } else {
                          if (movieByGenreState is MovieListByGenreLoading) {
                            return const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          } else if (movieByGenreState
                              is MovieListByGenreLoaded) {
                            return MovieCardsGridView(
                              height: height,
                              movieListByGenreEntitie:
                                  movieByGenreState.movieListByGenreEntitie,
                              movieListEntity: null,
                            );
                          } else {
                            return const SliverToBoxAdapter(
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                        }
                      },
                    ),
                    BlocBuilder<MovieListBloc, MovieListState>(
                      builder: (context, state) {
                        if (selectedGenere == 0) {
                          if (state is MovieListLoading) {
                            return SliverToBoxAdapter(
                              child: Container(),
                            );
                          } else if (state is MovieListLoaded) {
                            return pagination(
                                context: context,
                                state: state,
                                movieListByGenreState: null);
                          } else {
                            return SliverToBoxAdapter(
                              child: Container(),
                            );
                          }
                        } else {
                          if (movieByGenreState is MovieListByGenreLoading) {
                            return SliverToBoxAdapter(
                              child: Container(),
                            );
                          } else if (movieByGenreState
                              is MovieListByGenreLoaded) {
                            return pagination(
                                context: context,
                                movieListByGenreState: movieByGenreState,
                                state: null);
                          } else {
                            return SliverToBoxAdapter(
                              child: Container(),
                            );
                          }
                        }
                      },
                    )
                  ],
                ),
                backgroundColor: Palete.darkblue,
              );
            },
          ),
        );
      },
    );
  }

  SliverToBoxAdapter pagination(
      {required BuildContext context,
      MovieListLoaded? state,
      MovieListByGenreLoaded? movieListByGenreState}) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: currentPage > 1 ? () => _goToFirstPage(context) : null,
            icon: const Icon(
              Icons.keyboard_double_arrow_left_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: currentPage > 1 ? () => _previousPage(context) : null,
            icon: const Icon(
              Icons.keyboard_arrow_left_rounded,
              color: Colors.white,
            ),
          ),
          Card(
            color: Palete.purple,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 10,
                left: 10,
                top: 5,
                bottom: 5,
              ),
              child: Text(
                currentPage.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
          state == null
              ? IconButton(
                  onPressed: currentPage <
                          movieListByGenreState!
                              .movieListByGenreEntitie!.metadata.page_count
                      ? () => _nextPage(
                          context,
                          movieListByGenreState
                              .movieListByGenreEntitie!.metadata.page_count)
                      : null,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: currentPage <
                          state.movieListEntity!.metadata!.pageCount!
                      ? () => _nextPage(
                          context, state.movieListEntity!.metadata!.pageCount!)
                      : null,
                  icon: const Icon(
                    Icons.keyboard_arrow_right_rounded,
                    color: Colors.white,
                  ),
                ),
          state == null
              ? IconButton(
                  onPressed: currentPage <
                          movieListByGenreState!
                              .movieListByGenreEntitie!.metadata.page_count
                      ? () => _goToLastPage(
                          context,
                          movieListByGenreState
                              .movieListByGenreEntitie!.metadata.page_count)
                      : null,
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: currentPage <
                          state.movieListEntity!.metadata!.pageCount!
                      ? () => _goToLastPage(
                          context, state.movieListEntity!.metadata!.pageCount!)
                      : null,
                  icon: const Icon(
                    Icons.keyboard_double_arrow_right_rounded,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
    );
  }

  void _previousPage(BuildContext context) {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
        if (selectedGenere == 0) {
          BlocProvider.of<MovieListBloc>(context)
              .add(LoadListMovie(currentPage));
        } else {
          BlocProvider.of<MovieListByGenreBloc>(context).add(
              LoadMovieListByGenreEvent(
                  page: currentPage, genreId: selectedGenere));
        }
      });
    }
  }

  void _nextPage(BuildContext context, int pageCount) {
    if (currentPage < pageCount) {
      setState(() {
        currentPage++;
        if (selectedGenere == 0) {
          BlocProvider.of<MovieListBloc>(context)
              .add(LoadListMovie(currentPage));
        } else {
          BlocProvider.of<MovieListByGenreBloc>(context).add(
              LoadMovieListByGenreEvent(
                  page: currentPage, genreId: selectedGenere));
        }
      });
    }
  }

  void _goToFirstPage(BuildContext context) {
    setState(() {
      currentPage = 1;
      if (selectedGenere == 0) {
        BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
      } else {
        BlocProvider.of<MovieListByGenreBloc>(context).add(
            LoadMovieListByGenreEvent(
                page: currentPage, genreId: selectedGenere));
      }
    });
  }

  void _goToLastPage(BuildContext context, int pageCount) {
    setState(() {
      currentPage = pageCount;

      if (selectedGenere == 0) {
        BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
      } else {
        BlocProvider.of<MovieListByGenreBloc>(context).add(
            LoadMovieListByGenreEvent(
                page: currentPage, genreId: selectedGenere));
      }
    });
  }
}
