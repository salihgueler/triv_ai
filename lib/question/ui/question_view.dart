import 'package:flutter/material.dart';
import 'package:triv_ai/question/data/question.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({
    required this.question,
    required this.onSelected,
    super.key,
  });

  final Question question;
  final ValueChanged<String> onSelected;
  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 200,
              ),
              child: Card(
                color: Theme.of(context).colorScheme.tertiary.withAlpha(200),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      widget.question.title,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ...widget.question.options.map(
            (option) => Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  widget.onSelected(option);
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(option),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
