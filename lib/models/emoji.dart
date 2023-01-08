import 'package:equatable/equatable.dart';

class Emoji extends Equatable {
  const Emoji({
    required this.emoji,
    required this.created,
    required this.updated,
  });

  factory Emoji.fromJson(Map<String, dynamic> json) {
    return Emoji(
      emoji: json['emoji'],
      created: json['created'],
      updated: json['updated'],
    );
  }

  final String emoji;
  final DateTime created;
  final DateTime updated;

  Map<String, dynamic> toJson() {
    return {
      'emoji': emoji,
      'created': created,
      'updated': updated,
    };
  }

  Emoji copyWith({
    String? emoji,
    DateTime? created,
    DateTime? updated,
  }) {
    return Emoji(
      emoji: emoji ?? this.emoji,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  List<Object?> get props => [emoji, created, updated];

  @override
  bool get stringify => true;
}
