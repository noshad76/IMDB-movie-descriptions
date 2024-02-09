import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/widgets/inner_shadow.dart';

import '../../data/model/movie_list_model.dart';

class MovieDeatailsPage extends StatefulWidget {
  const MovieDeatailsPage({super.key, required this.id});
  final int id;
  @override
  State<MovieDeatailsPage> createState() => _MovieDeatailsPageState();
}

class _MovieDeatailsPageState extends State<MovieDeatailsPage> {
  @override
  void initState() {
    BlocProvider.of<MovieBloc>(context).add(LoadMovie(widget.id));
    super.initState();
  }

  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return BlocConsumer<MovieBloc, MovieState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is MovieLoading) {
          return const CircularProgressIndicator();
        } else if (state is MovieLoaded) {
          return Scaffold(
            backgroundColor: Palete.darkblue,
            appBar: AppBar(
              backgroundColor: Palete.darkblue,
              centerTitle: true,
              leading: IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Palete.white,
                  size: 30,
                ),
              ),
              actions: [
                Container(
                  height: height * 0.049,
                  decoration: BoxDecoration(
                    color: Palete.white,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  child: IconButton(
                    alignment: Alignment.center,
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Palete.darkblue,
                      size: 25,
                    ),
                  ),
                ),
              ],
              title: Text(
                'BlueRibbon',
                style: TextStyle(
                    color: Palete.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    height: 1.2),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    topSection(height, width, state),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Container(
                      height: height * 0.06,
                      decoration: BoxDecoration(
                          color: Palete.lightBlue,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Rated',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  state.movieEntity!.rated!,
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                          VerticalDivider(
                            color: Palete.white,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Country',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  'USA',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      overflow: TextOverflow.ellipsis),
                                )
                              ]),
                          VerticalDivider(
                            color: Palete.white,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Runtime',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  state.movieEntity!.runtime!,
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                          VerticalDivider(
                            color: Palete.white,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Metascore',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  state.movieEntity!.metascore!,
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                          VerticalDivider(
                            color: Palete.white,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'IMDb Votes',
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                Text(
                                  state.movieEntity!.imdbVotes!,
                                  style: TextStyle(
                                      color: Palete.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                )
                              ]),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      height: height * 0.07,
                      width: width,
                      decoration: BoxDecoration(
                        color: Palete.purple,
                      ),
                      child: Text(
                        state.movieEntity!.plot!,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Palete.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: width,
                      decoration: BoxDecoration(
                          color: Palete.gold,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Text(
                        state.movieEntity!.awards!,
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: TextStyle(
                            color: Palete.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Related:',
                        style: TextStyle(
                          color: Palete.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    BlocBuilder<MovieListBloc, MovieListState>(
                      builder: (context, movieListState) {
                        return Row(
                          children: [
                            relatedMovies(height, width, context,
                                movieListState.movieListEntity!.data![3]),
                            relatedMovies(height, width, context,
                                movieListState.movieListEntity!.data![4]),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Palete.darkblue,
            body: const Text('faild'),
          );
        }
      },
    );
  }

  SizedBox relatedMovies(
      double height, double width, BuildContext context, Data? data) {
    return SizedBox(
      height: height * 0.345,
      width: width * 0.45,
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => MovieDeatailsPage(id: data.id!)));
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
                  data!.poster!,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: height * 0.27,
                  ),
                  Text(data.title!,
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
                            data.year!,
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
                            data.imdbRating!,
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
      ),
    );
  }

  Stack topSection(double height, double width, MovieLoaded state) {
    return Stack(children: [
      Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              width: width * 0.45,
              height: state.movieEntity!.title!.characters.length > 24
                  ? height * 0.05
                  : height * 0.035,
              child: Text(
                state.movieEntity!.title!,
                maxLines: 2,
                style: TextStyle(
                    color: Palete.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            SizedBox(
              width: width * 0.46,
              height: height * 0.04,
              child: ListView(
                padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                    state.movieEntity!.genres!.length,
                    (index) => Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Palete.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              state.movieEntity!.genres![index],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 13,
                                color: Palete.darkblue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: width * 0.46,
              height: height * 0.04,
              decoration: BoxDecoration(
                  color: Palete.lightBlue,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: height * 0.05,
                    width: width * 0.22,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Palete.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text(state.movieEntity!.imdbRating!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Palete.darkblue)),
                              Text(
                                '/10',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Palete.darkblue,
                                    fontSize: 10),
                              ),
                            ],
                          ),
                          Text(
                            'IMDb',
                            style: TextStyle(
                                color: Palete.gold,
                                fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: Text(
                      state.movieEntity!.released!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Palete.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              width: width * 0.6,
              height: state.movieEntity!.title!.characters.length > 24
                  ? height * 0.17
                  : height * 0.185,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(15))),
              child: Stack(
                children: [
                  PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        selectedImage = value;
                      });
                    },
                    itemCount: state.movieEntity!.images!.length,
                    itemBuilder: (context, index) {
                      return Image.network(
                        state.movieEntity!.images![index],
                        fit: BoxFit.fill,
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        state.movieEntity!.images!.length,
                        (index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 2, vertical: 2),
                              height: width * 0.02,
                              width: width * 0.02,
                              decoration: BoxDecoration(
                                  color: selectedImage == index
                                      ? Palete.purple
                                      : Palete.white,
                                  shape: BoxShape.circle),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
        const Spacer()
      ]),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: height * 0.355,
          width: width * 0.45,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
          child:
              Image.network(state.movieEntity!.poster!, fit: BoxFit.fitHeight),
        ),
      )
    ]);
  }
}
