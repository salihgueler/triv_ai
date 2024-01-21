import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triv_ai/routes.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const TrivAIApp());
}

class TrivAIApp extends StatelessWidget {
  const TrivAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: FlexThemeData.light(
        scheme: FlexScheme.blueWhale,
        fontFamily: GoogleFonts.kanit().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.blueWhale,
        fontFamily: GoogleFonts.kanit().fontFamily,
      ),
      // home: QuizScreen(
      //   questions: [
      //     Question(
      //       id: '1',
      //       title: 'What is the capital of Türkiye?',
      //       answer: 'Ankara',
      //       category: 'Geography',
      //       options: ['İstanbul', 'Ankara', 'İzmir', 'Antalya'],
      //       createdAt: DateTime.now().toString(),
      //       updatedAt: DateTime.now().toString(),
      //     ),
      //   ],
      // ),
    );
  }
}
