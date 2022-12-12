import 'package:equatable/equatable.dart';

class GetEmojiModel extends Equatable {
  const GetEmojiModel({
    required this.question,
    required this.answer,
  });

  factory GetEmojiModel.fromJson(Map<String, dynamic> json) {
    return GetEmojiModel(
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }

  final String question;
  final String answer;

  @override
  List<Object?> get props => [question, answer];

  @override
  bool get stringify => true;
}
