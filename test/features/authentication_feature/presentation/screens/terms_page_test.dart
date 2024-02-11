import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/cubit/cubit/terms_page_cubit.dart';
import 'package:movie_app/features/authentication_feature/presentation/screens/terms_page.dart';


class MockTermPageCubit extends MockCubit<TermsPageState>
    implements TermsPageCubit {
  @override
  bool privacyPolicy = false;
  @override
  bool terms = false;
}

void main() {
  late MockTermPageCubit mockTermsPageCubit;

  setUp(() {
    mockTermsPageCubit = MockTermPageCubit();
  });
  final page = MultiBlocProvider(
    providers: [
      BlocProvider<TermsPageCubit>(
        create: (context) => mockTermsPageCubit,
      ),
    ],
    child: const MaterialApp(
      home: TermsPage(),
    ),
  );

  testWidgets('is going to login page', (widgetTester) async {
    when(() => mockTermsPageCubit.state).thenReturn(TermsPageInitial());
    await widgetTester.pumpWidget(page);

    var termscheckbox = find.byKey(const Key('termcheckbox'));
    expect(termscheckbox, findsOneWidget);
    await widgetTester.tap(termscheckbox);

    var policycheckbox = find.byKey(const Key('policycheckbox'));
    expect(policycheckbox, findsOneWidget);
    await widgetTester.tap(policycheckbox);

    await widgetTester.pump();
    var loginButton = find.byKey(const Key("loginButton"));
    expect(loginButton, findsOneWidget);
    await widgetTester.tap(loginButton);
  });
}
