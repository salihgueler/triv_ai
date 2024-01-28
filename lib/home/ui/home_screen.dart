import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:triv_ai/home/data/home_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late final HomeCubit _homeCubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Triv.ai'),
        actions: [
          IconButton(
            onPressed: () async {
              _homeCubit.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              Text(
                'Welcome to Triv.ai',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Test your knowledge with our quiz app, select the category you want to test yourself on \nand start the quiz.',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  context.push('/generate-quiz');
                },
                child: const Text('Generate Quiz'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  context.push('/result-list');
                },
                child: const Text('See Earlier Results'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
