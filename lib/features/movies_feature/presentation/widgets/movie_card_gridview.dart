
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/inner_shadow.dart';

class MovieCardsGridView extends StatelessWidget {
  const MovieCardsGridView({
    super.key,
    required this.height, required this.state,
  });

  final double height;
  final MovieListState state;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      sliver: SliverGrid.builder(
        itemCount: state.movieListEntity!.data!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: height * 0.35,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return Card(
            clipBehavior: Clip.hardEdge,
            color: Palete.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Stack(
              fit: StackFit.expand,
              children: [
                InnerShadow(
                  blur: 20,
                  color: Colors.black,
                  offset: const Offset(0, -70),
                  child: Image.network(
                    state.movieListEntity!.data![index].poster!,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: height * 0.27,
                    ),
                    Text(state.movieListEntity!.data![index].title!,
                        maxLines: 1,
                        style: TextStyle(
                          color: Palete.white,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              color: Palete.purple,
                            ),
                            Text(
                              state.movieListEntity!.data![index].year!,
                              style: TextStyle(
                                  color: Palete.purple,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Palete.purple,
                            ),
                            Text(
                              state.movieListEntity!.data![index].imdbRating!,
                              style: TextStyle(
                                  color: Palete.purple,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
