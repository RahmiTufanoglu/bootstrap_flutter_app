import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:form_app/services/get_emoji_model.dart';

Future<List<GetEmojiModel>> getEmoji() async {
  final data = rootBundle.loadString('assets/data.json');
  final map = jsonDecode(await data) as Map;
  final list = map['data'] as List;

  final result = list.map((element) {
    return GetEmojiModel.fromJson(element);
  }).toList();

  return result;
}
