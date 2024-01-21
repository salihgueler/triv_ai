class Question {
  const Question({
    required this.id,
    required this.title,
    required this.answer,
    required this.category,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
  });

  final String id;
  final String title;
  final String answer;
  final String category;
  final List<String> options;
  final String createdAt;
  final String updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      answer: json['answer'],
      category: json['category'],
      options: json['options'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'answer': answer,
        'category': category,
        'options': options,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };

  @override
  String toString() {
    return 'Question{id: $id, title: $title, answer: $answer, category: $category, options: $options, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Question &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          answer == other.answer &&
          category == other.category &&
          options == other.options &&
          createdAt == other.createdAt &&
          updatedAt == other.updatedAt;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      answer.hashCode ^
      category.hashCode ^
      options.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
