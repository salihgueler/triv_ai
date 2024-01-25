import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:triv_ai/quiz/data/quiz_cubit.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
      ),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizFinishedState) {
            return Column(
              children: [
                Text(
                  'Your score is ${state.score.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<QuizCubit>().resetQuiz();
                            context.go('/generate-quiz');
                          },
                          child: const Text('Play Again'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Save the Quiz'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.questions.length,
                    itemBuilder: (context, index) {
                      final question = state.questions[index];
                      final answer = state.answers[index];
                      return ListTile(
                        title: Text(question.title),
                        subtitle: answer != question.answer
                            ? Text(
                                'Your answer: $answer and correct answer: ${question.answer}')
                            : const SizedBox.shrink(),
                        trailing: Icon(
                          answer == question.answer
                              ? Icons.check_circle
                              : Icons.cancel,
                          color: answer == question.answer
                              ? Colors.green
                              : Colors.red,
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
