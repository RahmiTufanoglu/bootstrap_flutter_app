import 'package:form_app/models/emoji.dart';

class EmojiListData {
  const EmojiListData({
    required this.emojis,
    required this.totalPages,
  });

  final List<Emoji> emojis;
  final int totalPages;
}
