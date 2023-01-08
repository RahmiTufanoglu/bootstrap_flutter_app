import 'package:form_app/models/emoji.dart';
import 'package:form_app/models/emoji_list_data.dart';
import 'package:pocketbase/pocketbase.dart';

final client = PocketBase('http://127.0.0.1:8090');

class PocketBaseService {
  Future<EmojiListData> getEmojiListData({required int page}) async {
    await client.collection('users').authWithPassword('rahmi@gmail.com', 'Test.12345');
    //await client.users.authViaEmail('rahmi.tufanoglu@gmail.com', 'Test.12345');

    // fetch a paginated records list
    final resultList = await client.collection('user_status').getList(
      //'user_status',
      page: page,
      perPage: 10,
      sort: '-created',
    );

    final list = resultList.items.map((element) {
      return Emoji.fromJson({
        'emoji': element.data['emoji'],
        'created': DateTime.parse(element.created),
        'updated': DateTime.parse(element.updated),
      });
    }).toList();

    return EmojiListData(
      emojis: list,
      totalPages: resultList.totalPages,
    );
  }
}
