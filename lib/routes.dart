import 'package:go_router/go_router.dart';
import 'package:triv_ai/home/ui/home_screen.dart';
import 'package:triv_ai/quiz/ui/quiz_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: '/quiz',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: QuizScreen(),
      ),
    ),
  ],
);
