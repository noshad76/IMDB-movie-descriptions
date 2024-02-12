import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/features/authentication_feature/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:movie_app/features/authentication_feature/presentation/screens/login_page.dart';

import '../../test_helper/test_helper.dart';

class MockAuthenticationBloc
    extends MockBloc<AuthenticationEvent, AuthenticationState>
    implements AuthenticationBloc {}

void main() {
  late MockAuthenticationBloc mockAuthenticationBloc;

  setUp(() {
    mockAuthenticationBloc = MockAuthenticationBloc();
  });
  TestWidgetsFlutterBinding.ensureInitialized();
  final page = MultiBlocProvider(
    providers: [
      BlocProvider<AuthenticationBloc>(
        create: (context) => mockAuthenticationBloc,
      ),
    ],
    child: const MaterialApp(
      home: LoginPage(),
    ),
  );

  testWidgets('is going to home page', (widgetTester) async {
    when(() => mockAuthenticationBloc.state)
        .thenReturn(const AuthenticationInit());
    FlutterError.onError = ignoreOverflowErrors;
    await widgetTester.pumpWidget(page);
    var emailtf = find.byKey(const Key('emailtf'));
    expect(emailtf, findsOneWidget);
   await widgetTester.enterText(emailtf, 'asmdk@jaksd.asd');
    
    var passwordtf = find.byKey(const Key('Passwordtf'));
    expect(passwordtf, findsOneWidget);
   await widgetTester.enterText(passwordtf, 'asdasdasdasd');
    
  });
}
