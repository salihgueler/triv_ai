import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:triv_ai/result/data/results_cubit.dart';

class ResultDetailScreen extends StatefulWidget {
  const ResultDetailScreen({
    required this.index,
    super.key,
  });

  final String index;

  @override
  State<ResultDetailScreen> createState() => _ResultDetailScreenState();
}

class _ResultDetailScreenState extends State<ResultDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final state = context.read<ResultsCubit>().state as ResultsSuccess;
    final result = state.results[int.parse(widget.index)];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result detail'),
      ),
      body: Column(
        children: [
          Text(
            'Your score is ${result.score.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: result.answers.length,
              itemBuilder: (context, index) {
                final question = result.questions![index];
                final answer = result.answers[index];
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
                    color:
                        answer == question.answer ? Colors.green : Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
