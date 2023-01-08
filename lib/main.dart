import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_app/app.dart';
import 'package:form_app/app_start_loader_page.dart';
import 'package:form_app/utils/logger.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  runApp(const AppStartLoaderPage());

  /*
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  */

  await runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();

    initLogger();

    await Firebase.initializeApp();

    // Pass all uncaught "fatal" errors from the framework to Crashlytics
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

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
      const ProviderScope(
        child: App(),
        /*child: FutureBuilder(
          future: setupRemoteConfig(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const App();
            }
            return const App();
            return const CupertinoActivityIndicator();
          },
        ),*/
      ),
    );
  }, (error, stack) {
    //FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  });
}
