import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triv_ai/quiz/data/quiz_cubit.dart';
import 'package:triv_ai/result/data/results_cubit.dart';
import 'package:triv_ai/routes.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  usePathUrlStrategy();
  runApp(const TrivAIApp());
}

class TrivAIApp extends StatelessWidget {
  const TrivAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuizCubit(),
        ),
        BlocProvider(
          create: (context) => ResultsCubit(),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
