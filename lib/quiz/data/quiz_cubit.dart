import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:triv_ai/models/Question.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  QuizCubit() : super(QuizInitial());

  final _questions = <Question>[
    Question(
      id: '1',
      title: 'What is the capital of Türkiye?',
      answer: 'Ankara',
      category: 'Geography',
      options: ['İstanbul', 'Ankara', 'İzmir', 'Antalya'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '2',
      title: 'Who wrote "Hamlet"?',
      answer: 'William Shakespeare',
      category: 'Literature',
      options: ['Charles Dickens', 'William Shakespeare', 'Leo Tolstoy', 'Mark Twain'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '3',
      title: 'Which planet is known as the Red Planet?',
      answer: 'Mars',
      category: 'Astronomy',
      options: ['Jupiter', 'Mars', 'Venus', 'Mercury'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '4',
      title: 'What is the main ingredient in guacamole?',
      answer: 'Avocado',
      category: 'Cuisine',
      options: ['Tomato', 'Potato', 'Avocado', 'Eggplant'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '5',
      title: 'In what year did the Titanic sink?',
      answer: '1912',
      category: 'History',
      options: ['1912', '1910', '1914', '1908'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '6',
      title: 'Which element has the chemical symbol "O"?',
      answer: 'Oxygen',
      category: 'Science',
      options: ['Gold', 'Oxygen', 'Silver', 'Iron'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '7',
      title: 'What is the largest mammal in the world?',
      answer: 'Blue Whale',
      category: 'Nature',
      options: ['Elephant', 'Blue Whale', 'Giraffe', 'Hippopotamus'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '8',
      title: 'Who painted the Mona Lisa?',
      answer: 'Leonardo da Vinci',
      category: 'Art',
      options: ['Vincent Van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '9',
      title: 'What is the capital of Japan?',
      answer: 'Tokyo',
      category: 'Geography',
      options: ['Kyoto', 'Osaka', 'Tokyo', 'Hiroshima'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
    Question(
      id: '10',
      title: 'Who is known as the father of modern physics?',
      answer: 'Albert Einstein',
      category: 'Science',
      options: ['Isaac Newton', 'Galileo Galilei', 'Nikola Tesla', 'Albert Einstein'],
      difficulty: "Easy",
      createdAt: TemporalDateTime(DateTime.now()),
      updatedAt: TemporalDateTime(DateTime.now()),
    ),
  ];

  Future<void> generateQuestions() async {
    emit(QuizQuestionsLoading());
    emit(QuizSuccess(_questions, _questions.first, 0));
  }

  Future<void> changeQuestion(int index) async {
    final nextIndex = index + 1;
    if (nextIndex == _questions.length) {
      emit(QuizFinishedState());
    } else {
      emit(
        QuizSuccess(
          _questions,
          _questions[nextIndex],
          nextIndex,
        ),
      );
    }
  }
}
