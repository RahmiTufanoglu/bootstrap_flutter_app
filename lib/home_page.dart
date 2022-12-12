import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_app/login_page.dart';
import 'package:form_app/services/get_emoji.dart';
import 'package:form_app/services/get_emoji_model.dart';
import 'package:form_app/themes/text_style_extension.dart';
import 'package:form_app/themes/theme_helper.dart';
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

  @override
  void initState() {
    super.initState();
    data = getEmoji();
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
