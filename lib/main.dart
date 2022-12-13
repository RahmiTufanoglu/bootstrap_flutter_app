import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/app.dart';
import 'package:form_app/app_start_loader.dart';
import 'package:form_app/utils/logger.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  runApp(const AppStartLoader());

  /*
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  */

  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    initLogger();

    //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    /*
    final container = ProviderContainer(
      overrides: [],
    )..read(formProvider);

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const ProviderScope(child: App()),
      ),
    );
    */

    Logger('main.dart').info('App started.');

    runApp(
      const ProviderScope(child: App()),
    );
  }, (error, stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
