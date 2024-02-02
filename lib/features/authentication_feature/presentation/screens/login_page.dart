import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:movie_app/features/authentication_feature/presentation/widgets/login_button.dart';
import 'package:movie_app/locator_container.dart';

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
    return Scaffold(
      backgroundColor: Palete.darkblue,
      body: Column(
        children: [
          const Spacer(
            flex: 4,
          ),
          Text(
            'Login to',
            style: TextStyle(
                color: Palete.white, fontSize: 28, fontWeight: FontWeight.w400),
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
                      BlocBuilder<AuthenticationBloc, AuthenticationState>(
                        builder: (context, state) {
                          if (state is AuthenticationInit) {
                            return LoginButton(
                              width: width * 0.85,
                              height: height * 0.05,
                              color: Palete.purple,
                              text: const Text('Login',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                getIt<AuthenticationBloc>().add(SignUpInApp(
                                  email: userName.text,
                                  password: password.text,
                                ));
                              },
                            );
                          } else if (state is AuthenticationLoading) {
                            return LoginButton(
                              width: width * 0.85,
                              height: height * 0.05,
                              color: Palete.purple,
                              onPressed: () {},
                              text: const CircularProgressIndicator(),
                            );
                          } else if (state is AuthenticationDone) {
                            // Handle success state
                            // You might want to navigate to another screen or show a success message
                            return LoginButton(
                              width: width * 0.85,
                              height: height * 0.05,
                              color: Palete.purple,
                              text: const Text('Success!',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {},
                            );
                          } else if (state is AuthenticationFaild) {
                            // Handle failure state
                            // You might want to show an error message to the user
                            return LoginButton(
                              width: width * 0.85,
                              height: height * 0.05,
                              color: Palete.purple,
                              text: Text('Error: ${state.error}',
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {},
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
