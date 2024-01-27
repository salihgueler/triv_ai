import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:triv_ai/result/data/results_cubit.dart';

class ResultsListScreen extends StatefulWidget {
  const ResultsListScreen({super.key});

  @override
  State<ResultsListScreen> createState() => _ResultsListScreenState();
}

class _ResultsListScreenState extends State<ResultsListScreen> {

  @override
  void initState() {
    super.initState();
    context.read<ResultsCubit>().getResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Results List'),
      ),
      body: BlocBuilder<ResultsCubit, ResultsState>(
        builder: (context, state) {
          switch (state) {
            case ResultsInitial _:
            case ResultsLoading _:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Loading Results',
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    const CircularProgressIndicator(),
                  ],
                ),
              );
            case ResultsSuccess _:
              final result = state.results;
              if (result.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'No results found, please play a quiz and save your results.',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.go('/generate-quiz');
                          },
                          child: const Text('Generate Quiz'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: state.results.length,
                itemBuilder: (context, index) {
                  final item = result[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: () {
                          context.push('/result-detail/$index');
                        },
                        title: Text(
                          'You scored ${item.score.toStringAsFixed(2)} on this quiz.',
                        ),
                        subtitle: Text(
                          'You answered ${item.correctAnswerCount} questions correctly from ${item.answers.length} questions.',
                        ),
                      ),
                      const Divider(),
                    ],
                  );
                },
              );
            case ResultsError _:
              return Center(child: Text('Error: ${state.message}'));
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
