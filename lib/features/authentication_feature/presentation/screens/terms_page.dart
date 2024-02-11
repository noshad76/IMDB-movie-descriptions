import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/colors.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/cubit/cubit/terms_page_cubit.dart';
import 'package:toastification/toastification.dart';

import 'login_page.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    final TextStyle appNameStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(
            color: Palete.white,
            fontSize: 40,
            fontWeight: FontWeight.bold,
            height: 1.2);

    final TextStyle agreeTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15);
    final TextStyle termsAndPolicyTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Palete.purple,
              fontSize: height * 0.0186,
              fontWeight: FontWeight.w500,
            );
    final TextStyle desTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        // ignore: prefer_const_constructors
        .copyWith(color: Color(0xff625B71));
    return Scaffold(
      body: Container(
        color: Palete.darkblue,
        child: Column(
          children: [
            const Spacer(),
            Hero(
              tag: 'appname',
              child: Text(
                'BlueRibbon',
                style: appNameStyle,
              ),
            ),
            Text(
              'welcome',
              style: TextStyle(
                  color: Palete.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Hero(
              tag: 'cont',
              child: Container(
                decoration: BoxDecoration(
                  color: Palete.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                width: width,
                height: height * 0.35,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      height: height * 0.05,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          BlocBuilder<TermsPageCubit, TermsPageState>(
                            builder: (context, state) {
                              final cubit =
                                  BlocProvider.of<TermsPageCubit>(context);
                              return Card(
                                child: Checkbox(
                                  key: const Key('policycheckbox'),
                                  value: cubit.privacyPolicy,
                                  onChanged: (value) {
                                    cubit.togglePrivacy(value!);
                                  },
                                ),
                              );
                            },
                          ),
                          Text(
                            'I agree and accept',
                            style: agreeTextStyle,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text('Privacy Policy', style: termsAndPolicyTextStyle)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width * 0.8,
                      height: height * 0.05,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          BlocBuilder<TermsPageCubit, TermsPageState>(
                            builder: (context, state) {
                              final cubit = context.watch<TermsPageCubit>();
                              return Card(
                                child: Checkbox(
                                  key: const Key('termcheckbox'),
                                  value: cubit.terms,
                                  onChanged: (value) {
                                    cubit.toggleTerms(value!);
                                  },
                                ),
                              );
                            },
                          ),
                          Text(
                            'I agree and accept',
                            style: agreeTextStyle,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text('Terms of Use', style: termsAndPolicyTextStyle)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.027,
                    ),
                    SizedBox(
                      width: width * 0.69,
                      height: height * 0.05,
                      child: Text(
                        'You can only move forward if you agree to everything above',
                        textAlign: TextAlign.center,
                        style: desTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.027,
                    ),
                    BlocConsumer<TermsPageCubit, TermsPageState>(
                      listener: (context, state) {
                        if (state is TermsPageFaild) {
                          toastification.show(
                            context: context,
                            type: ToastificationType.error,
                            style: ToastificationStyle.flatColored,
                            title: const Text('Privacy Policy & Terms of Use'),
                            description: const Text(
                                'please accept our Rules to continue'),
                            alignment: Alignment.topCenter,
                            autoCloseDuration: const Duration(seconds: 5),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: lowModeShadow,
                            showProgressBar: true,
                            dragToClose: true,
                          );
                        }
                        if (state is TermsPageCompeleted) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return const LoginPage();
                            },
                          ));
                        }
                      },
                      builder: (context, state) {
                        final cubit = context.read<TermsPageCubit>();
                        if (state is TermsPageInitial) {
                          return ElevatedButton(
                            key:const Key('loginButton'),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Palete.purple),
                                minimumSize: MaterialStatePropertyAll(
                                    Size(width * 0.8, height * 0.05))),
                            onPressed: () async {
                              cubit.toNextPage();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else if (state is TermsPageLoading) {
                          return ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(Palete.purple),
                                  minimumSize: MaterialStatePropertyAll(
                                      Size(width * 0.8, height * 0.05))),
                              onPressed: () {},
                              child: SizedBox(
                                height: width * 0.05,
                                width: width * 0.05,
                                child: CircularProgressIndicator(
                                  color: Palete.white,
                                ),
                              ));
                        } else {
                          return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Palete.purple),
                                minimumSize: MaterialStatePropertyAll(
                                    Size(width * 0.8, height * 0.05))),
                            onPressed: () {
                              cubit.toNextPage();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
