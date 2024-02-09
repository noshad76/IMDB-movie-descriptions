import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/geners_feature/domain/entities/movie_list_by_genres.dart';
import 'package:movie_app/features/movies_feature/domain/entities/movie_list_entity.dart';
import 'package:movie_app/features/movies_feature/presentation/screens/movie_details_page.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/inner_shadow.dart';

class MovieCardsGridView extends StatelessWidget {
  const MovieCardsGridView(
      {super.key,
      required this.height,
      this.movieListEntity,
      this.movieListByGenreEntitie});
  final double height;
  final MovieListEntity? movieListEntity;
  final MovieListByGenreEntitie? movieListByGenreEntitie;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      sliver: SliverGrid.builder(
        itemCount: movieListEntity != null
            ? movieListEntity!.data!.length
            : movieListByGenreEntitie!.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: height * 0.35,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDeatailsPage(
                        id: movieListEntity != null
                            ? movieListEntity!.data![index].id!
                            : movieListByGenreEntitie!.data[index].id
                      )));
            },
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            child: Card(
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
                      movieListEntity != null
                          ? movieListEntity!.data![index].poster!
                          : movieListByGenreEntitie!.data[index].poster,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: height * 0.27,
                      ),
                      Text(
                          movieListEntity != null
                              ? movieListEntity!.data![index].title!
                              : movieListByGenreEntitie!.data[index].title,
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
                                movieListEntity != null
                                    ? movieListEntity!.data![index].year!
                                    : movieListByGenreEntitie!.data[index].year,
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
                                movieListEntity != null
                                    ? movieListEntity!.data![index].imdbRating!
                                    : movieListByGenreEntitie!
                                        .data[index].imdb_rating,
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
            ),
          );
        },
      ),
    );
  }
}
