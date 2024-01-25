import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:triv_ai/quiz/data/quiz_cubit.dart';

class GenerateQuizScreen extends StatefulWidget {
  const GenerateQuizScreen({super.key});

  @override
  State<GenerateQuizScreen> createState() => _GenerateQuizScreenState();
}

class _GenerateQuizScreenState extends State<GenerateQuizScreen> {
  final categories = <String>[];
  String difficulty = 'Easy';
  int questionCount = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Quiz'),
      ),
      body: BlocConsumer<QuizCubit, QuizState>(
        listener: (context, state) {
          if (state is QuizSuccess) {
            context.go('/quiz');
          }
        },
        builder: (context, state) {
          switch (state) {
            case QuizQuestionsLoading _:
            case QuizSuccess _:
              return const Center(
                child: Column(
                  children: [
                    Text('Loading questions'),
                    CircularProgressIndicator(),
                  ],
                ),
              );
            case QuizError _:
              return Center(child: Text('Error: ${state.message}'));
            default:
              return ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const Text('Categories'),
                  const Divider(),
                  CheckboxListTile(
                    value: categories.contains('Games'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('Games');
                        } else {
                          categories.remove('Games');
                        }
                      });
                    },
                    title: const Text('Games'),
                  ),
                  CheckboxListTile(
                    value: categories.contains('Movies'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('Movies');
                        } else {
                          categories.remove('Movies');
                        }
                      });
                    },
                    title: const Text('Movies'),
                  ),
                  CheckboxListTile(
                    value: categories.contains('Literature'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('Literature');
                        } else {
                          categories.remove('Literature');
                        }
                      });
                    },
                    title: const Text('Literature'),
                  ),
                  CheckboxListTile(
                    value: categories.contains('Sport'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('Sport');
                        } else {
                          categories.remove('Sport');
                        }
                      });
                    },
                    title: const Text('Sport'),
                  ),
                  CheckboxListTile(
                    value: categories.contains('History'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('History');
                        } else {
                          categories.remove('History');
                        }
                      });
                    },
                    title: const Text('History'),
                  ),
                  CheckboxListTile(
                    value: categories.contains('Geography'),
                    onChanged: (value) {
                      setState(() {
                        if (value ?? false) {
                          categories.add('Geography');
                        } else {
                          categories.remove('Geography');
                        }
                      });
                    },
                    title: const Text('Geography'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Difficulty'),
                  const Divider(),
                  CheckboxListTile(
                    value: difficulty == 'Easy',
                    onChanged: (value) {
                      if (value ?? false) {
                        setState(() {
                          difficulty = 'Easy';
                        });
                      }
                    },
                    title: const Text('Easy'),
                  ),
                  CheckboxListTile(
                    value: difficulty == 'Medium',
                    onChanged: (value) {
                      if (value ?? false) {
                        setState(() {
                          difficulty = 'Medium';
                        });
                      }
                    },
                    title: const Text('Medium'),
                  ),
                  CheckboxListTile(
                    value: difficulty == 'Hard',
                    onChanged: (value) {
                      if (value ?? false) {
                        setState(() {
                          difficulty = 'Hard';
                        });
                      }
                    },
                    title: const Text('Hard'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Number of Questions'),
                  const Divider(),
                  Slider(
                    value: questionCount.toDouble(),
                    onChanged: (value) {
                      setState(() {
                        questionCount = value.toInt();
                      });
                    },
                    label: questionCount.round().toString(),
                    min: 1,
                    divisions: 10,
                    max: 10,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<QuizCubit>().generateQuestions(
                            questionCount,
                            categories,
                            difficulty,
                          );
                    },
                    child: const Text('Generate Quiz'),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
