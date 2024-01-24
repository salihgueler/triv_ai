import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

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
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Test your knowledge with our quiz app, \nselect the category you want to test yourself on \nand start the quiz.',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // context.go('/quiz');
                  var url = Uri.https(
                    'q9000l7dqc.execute-api.eu-central-1.amazonaws.com',
                    'prod/generateQuiz',
                    {
                      "questionCount": "10",
                      "categoryList": "Sport,History,Geography",
                      "difficulty": "easy",
                    },
                  );
                  var response = await http.get(
                    url,
                    headers: {
                      "Access-Control-Allow-Origin": "*",
                      'Content-Type': 'application/json',
                      'Accept': '*/*'
                    },
                  );
                  final content = json.decode(response.body);
                  final outputText =
                      content["message"]["results"][0]["outputText"] as String;
                  final firstIndex = outputText.indexOf("{");
                  final lastIndex = outputText.lastIndexOf("}");
                  final chopped =
                      outputText.substring(firstIndex, lastIndex + 1);
                  final jsonToParse =
                      json.decode(chopped)["rows"] as List<dynamic>;
                  jsonToParse.forEach((element) {
                    print(element);
                  });
                },
                child: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
