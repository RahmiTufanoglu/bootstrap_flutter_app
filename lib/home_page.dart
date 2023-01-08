import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_app/login_page.dart';
import 'package:form_app/models/emoji_list_data.dart';
import 'package:form_app/pocketbase/pocketbase_service.dart';
import 'package:form_app/services/get_emoji.dart';
import 'package:form_app/services/get_emoji_model.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
import 'package:form_app/widgets/app_dialogs.dart';
import 'package:form_app/widgets/blurred_box.dart';
import 'package:form_app/widgets/centered_container.dart';
import 'package:form_app/widgets/unfocusable_app_bar.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Future<List<GetEmojiModel>> data;

  late final PocketBaseService _pocketBase;
  late Future<EmojiListData> _emojiListData;

  //final _remoteConfig = FirebaseRemoteConfig.instance;

  @override
  void initState() {
    super.initState();
    // ignore: discarded_futures
    data = getEmoji();
  }

  void _foo() {
    //await _remoteConfig.fetchAndActivate();
    //final welcomeMessage = _remoteConfig.getString('welcome');
    //print('X__________ $welcomeMessage');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UnfocusableAppBar(
        title: Text(
          'EmQji',
          style: context.themeExt<TextStyleExtension>().appBarTitle,
        ),
      ),
      body: CenteredContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.push('/${LoginPage.routeName}'),
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => throw Exception(),
              child: const Text('Throw Test Exception'),
            ),
            Stack(
              children: [
                SizedBox(
                  width: 200.0,
                  height: 200.0,
                  child: Text('A' * 300),
                ),
                BlurredBox(
                  width: 200.0,
                  height: 200.0,
                  imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: TextButton(
                    key: const Key('simple_dialog_key_button'),
                    onPressed: () async => AppDialog.simpleDialog(context),
                    child: const Text('Dialog Test'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            FutureBuilder<List<GetEmojiModel>>(
              future: data,
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const CupertinoActivityIndicator();
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(snapshot.data![index].answer),
                        const SizedBox(width: 10.0),
                        Text(snapshot.data![index].question),
                        const SizedBox(width: 10.0),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
