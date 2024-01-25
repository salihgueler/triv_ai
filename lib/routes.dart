import 'package:go_router/go_router.dart';
import 'package:triv_ai/home/ui/home_screen.dart';
import 'package:triv_ai/quiz/ui/generate_quiz_screen.dart';
import 'package:triv_ai/quiz/ui/quiz_result_screen.dart';
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
    GoRoute(
      path: '/result',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: QuizResultScreen(),
      ),
    ),
    GoRoute(
      path: '/generate-quiz',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: GenerateQuizScreen(),
      ),
    ),
  ],
);
