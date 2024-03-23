import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:movie_app/features/authentication_feature/presentation/widgets/login_button.dart';
import 'package:movie_app/features/geners_feature/presentation/bloc/bloc/genre_list_bloc/genre_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/bloc/movie_list_bloc/movie_list_bloc.dart';
import 'package:movie_app/features/movies_feature/presentation/screens/home_page.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwrodVisible = false;
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final TextStyle appnamestyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(
            color: Palete.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            height: 1.2);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palete.darkblue,
        body: Column(
          children: [
            const Spacer(
              flex: 4,
            ),
            Text(
              'Login to',
              style: TextStyle(
                  color: Palete.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ),
            Hero(
              tag: 'appname',
              child: Text('BlueRibbon', style: appnamestyle),
            ),
            const Spacer(),
            Hero(
              tag: 'cont',
              child: Container(
                width: width,
                height: height * 0.54,
                decoration: BoxDecoration(
                  color: Palete.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: Material(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.08),
                        SizedBox(
                          width: width * 0.85,
                          child: TextFormField(
                            key: const Key('emailtf'),
                            controller: userName,
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Palete.purple,
                              ),
                              labelStyle: TextStyle(color: Palete.purple),
                              hintText: 'Enter your Email',
                              hintStyle: TextStyle(color: Palete.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Palete.purple)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palete.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        SizedBox(
                          width: width * 0.85,
                          child: TextFormField(
                            key: const Key('Passwordtf'),
                            controller: password,
                            obscureText: passwrodVisible,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  passwrodVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Palete.purple,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    passwrodVisible = !passwrodVisible;
                                  });
                                },
                              ),
                              label: const Text('Password'),
                              labelStyle: TextStyle(color: Palete.purple),
                              hintText: 'Enter Password',
                              hintStyle: TextStyle(color: Palete.purple),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Palete.purple)),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Palete.purple,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.04),
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                          listener: (context, state) async {
                            if (state is AuthenticationFaild) {
                              toastification.show(
                                context: context,
                                type: ToastificationType.error,
                                style: ToastificationStyle.minimal,
                                title: const Text('somthing wrong!'),
                                description: Text(state.error!),
                                alignment: Alignment.topCenter,
                                autoCloseDuration: const Duration(seconds: 4),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: lowModeShadow,
                                showProgressBar: true,
                                dragToClose: true,
                                pauseOnHover: false,
                              );
                            } else if (state is AuthenticationDone) {
                              toastification.show(
                                context: context,
                                type: ToastificationType.success,
                                style: ToastificationStyle.minimal,
                                title: const Text('Welcome To BluRibbon'),
                                alignment: Alignment.topCenter,
                                autoCloseDuration: const Duration(seconds: 3),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: lowModeShadow,
                                showProgressBar: true,
                                dragToClose: true,
                                pauseOnHover: false,
                              );

                              Future.delayed(
                                const Duration(seconds: 3),
                                () async {
                                  BlocProvider.of<MovieListBloc>(context)
                                      .add(LoadListMovie(1));
                                  BlocProvider.of<GenreBloc>(context)
                                      .add(LoadGenreList());

                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) {
                                      return const HomePage();
                                    },
                                  ));
                                },
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is AuthenticationInit) {
                              return LoginButton(
                                width: width * 0.85,
                                height: height * 0.05,
                                color: Palete.purple,
                                text: const Text('Login',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(SignUpInApp(
                                          email: userName.text,
                                          password: password.text));
                                },
                              );
                            } else if (state is AuthenticationLoading) {
                              return LoginButton(
                                key: const Key('tohomepage'),
                                width: width * 0.85,
                                height: height * 0.05,
                                color: Palete.purple,
                                onPressed: () {},
                                text: SizedBox(
                                  height: width * 0.05,
                                  width: width * 0.05,
                                  child: CircularProgressIndicator(
                                    color: Palete.white,
                                  ),
                                ),
                              );
                            } else if (state is AuthenticationFaild) {
                              return LoginButton(
                                width: width * 0.85,
                                height: height * 0.05,
                                color: Palete.purple,
                                text: const Text('Try Again',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  BlocProvider.of<AuthenticationBloc>(context)
                                      .add(SignUpInApp(
                                          email: userName.text,
                                          password: password.text));
                                },
                              );
                            } else {
                              // Handle other states or a default state
                              return LoginButton(
                                width: width * 0.85,
                                height: height * 0.05,
                                color: Palete.purple,
                                text: const Text('Login',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {},
                              );
                            }
                          },
                        ),
                        SizedBox(height: height * 0.03),
                        Row(
                          children: [
                            Container(
                              color: Palete.purple,
                              height: 1,
                              width: 175,
                            ),
                            const Spacer(),
                            Text(
                              'OR',
                              style: TextStyle(color: Palete.purple),
                            ),
                            const Spacer(),
                            Container(
                              color: Palete.purple,
                              height: 1,
                              width: 175,
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.02),
                        LoginButton(
                          width: width * 0.85,
                          height: height * 0.05,
                          color: Palete.darkblue,
                          text: const Text('Login as gust',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            BlocProvider.of<MovieListBloc>(context)
                                .add(LoadListMovie(1));
                            BlocProvider.of<GenreBloc>(context)
                                .add(LoadGenreList());

                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) {
                                return const HomePage();
                              },
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
