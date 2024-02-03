import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genre_list_bloc/genre_bloc.dart';
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
      builder: (context, state) {
        return DefaultTabController(
          length: state is GenreListLoaded
              ? BlocProvider.of<GenreBloc>(context)
                  .state
                  .genrelistEntitie!
                  .length
              : 4,
          initialIndex: 0,
          child: Scaffold(
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
                                    genre: 'All',
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
                                });
                              },
                              tabs: List.generate(
                                state.genrelistEntitie!.length,
                                (index) => GenreChips(
                                    genre: state.genrelistEntitie![index].name,
                                    index: index,
                                    height: height,
                                    width: width,
                                    selectedGenere: selectedGenere),
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
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
                    if (state is MovieListLoading) {
                      return const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    } else if (state is MovieListLoaded) {
                      return MovieCardsGridView(
                        height: height,
                        state: state,
                      );
                    } else {
                      return const SliverToBoxAdapter(
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
                BlocBuilder<MovieListBloc, MovieListState>(
                  builder: (context, state) {
                    if (state is MovieListLoaded) {
                      return SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: currentPage > 1
                                  ? () => _goToFirstPage(context)
                                  : null,
                              icon: const Icon(
                                Icons.keyboard_double_arrow_left_rounded,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: currentPage > 1
                                  ? () => _previousPage(context)
                                  : null,
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
                            IconButton(
                              onPressed: currentPage <
                                      state
                                          .movieListEntity!.metadata!.pageCount!
                                  ? () => _nextPage(
                                      context,
                                      state.movieListEntity!.metadata!
                                          .pageCount!)
                                  : null,
                              icon: const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.white,
                              ),
                            ),
                            IconButton(
                              onPressed: currentPage <
                                      state
                                          .movieListEntity!.metadata!.pageCount!
                                  ? () => _goToLastPage(
                                      context,
                                      state.movieListEntity!.metadata!
                                          .pageCount!)
                                  : null,
                              icon: const Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: Container(),
                      );
                    }
                  },
                )
              ],
            ),
            backgroundColor: Palete.darkblue,
          ),
        );
      },
    );
  }

  void _previousPage(BuildContext context) {
    if (currentPage > 1) {
      setState(() {
        currentPage--;
        BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
      });
    }
  }

  void _nextPage(BuildContext context, int pageCount) {
    if (currentPage < pageCount) {
      setState(() {
        currentPage++;
        BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
      });
    }
  }

  void _goToFirstPage(BuildContext context) {
    setState(() {
      currentPage = 1;
      BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
    });
  }

  void _goToLastPage(BuildContext context, int pageCount) {
    setState(() {
      currentPage = pageCount;
      BlocProvider.of<MovieListBloc>(context).add(LoadListMovie(currentPage));
    });
  }
}
