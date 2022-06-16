import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_review_app/utils/util.dart';
import 'package:movie_review_app/views/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_review_app/views/root.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ja', ''), // Spanish, no country code
      ],
      debugShowCheckedModeBanner: false,
      title: 'Movie Review',
      theme: ThemeData.dark().copyWith(
          inputDecorationTheme: InputDecorationTheme(
        border: kInputBorderStyle,
        enabledBorder: kInputBorderStyle,
        focusedBorder: kInputBorderStyle,
      )),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is signed in
            return const Root();
          } else {
            // User is not signed in
            return SignInScreen(
              providerConfigs: const [
                EmailProviderConfiguration(),
              ],
              headerBuilder: (context, constraints, _) => Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: headingText(label: '映画レビュー', fontSize: 40),
                ),
              ),
            );
          }
        },
      );
}
