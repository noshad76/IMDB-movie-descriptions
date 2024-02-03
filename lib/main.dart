import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/cubit/cubit/terms_page_cubit.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genre_list_bloc/genre_bloc.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/movie_list_by_genre_bloc/bloc/movie_list_by_genre_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_bloc/movie_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/locator_container.dart';

import 'features/authentication_feature/presentation/screens/terms_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TermsPageCubit(),
          child: Container(),
        ),
        BlocProvider<AuthenticationBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<MovieBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<MovieListBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<GenreBloc>(
          create: (context) => getIt(),
        ),
        BlocProvider<MovieListByGenreBloc>(
          create: (context) => getIt(),
        )
      ],
      child: MaterialApp(
        title: 'BlueRibbon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Scaffold(body: TermsPage()),
      ),
    );
  }
}
