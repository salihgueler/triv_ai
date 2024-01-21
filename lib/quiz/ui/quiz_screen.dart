import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:triv_ai/question/ui/question_view.dart';
import 'package:triv_ai/quiz/data/quiz_cubit.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final QuizCubit _quizCubit = QuizCubit();

  @override
  void initState() {
    super.initState();
    _quizCubit.generateQuestions();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizCubit, QuizState>(
      bloc: _quizCubit,
      listener: (context, state) {
        if (state is QuizFinishedState) {
          context.go('/');
        }
      },
      builder: (context, state) {
        switch (state) {
          case QuizInitial _:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case QuizSuccess _:
            final questions = state.questions;
            return Scaffold(
              appBar: AppBar(
                title: Text(state.currentQuestion.category),
              ),
              body: ListView(
                children: [
                  ListTile(
                    leading: Text(
                      'Question ${state.currentQuestionIndex}/${questions.length}',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    // leading: Text(
                    //   'Question $_currentQuestionIndex/${widget.questions.length}',
                    //   style: Theme.of(context).textTheme.headlineSmall,
                    // ),
                    trailing: Text(
                      'Remaining 30 seconds',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  QuestionView(
                    question: state.currentQuestion,
                    onSelected: (String value) {
                      _quizCubit.changeQuestion(state.currentQuestionIndex);
                    },
                  ),
                ],
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
