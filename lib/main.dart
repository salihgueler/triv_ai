import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:triv_ai/amplifyconfiguration.dart';
import 'package:triv_ai/routes.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  usePathUrlStrategy();
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
  } on AmplifyException catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
  runApp(const TrivAIApp());
}

Future<void> _configureAmplify() async {
  try {
    await Amplify.addPlugin(AmplifyAuthCognito());
    await Amplify.configure(amplifyConfig);
    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class TrivAIApp extends StatelessWidget {
  const TrivAIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        builder: Authenticator.builder(),
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
