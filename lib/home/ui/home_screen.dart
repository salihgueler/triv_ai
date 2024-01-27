import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
