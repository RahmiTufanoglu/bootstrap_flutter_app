import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<FirebaseRemoteConfig> setupRemoteConfig() async {
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ),
  );
  await remoteConfig.setDefaults(
    {
      'welcome': 'default welcome',
      'hello': 'default hello',
    },
  );
  RemoteConfigValue(null, ValueSource.valueStatic);
  return remoteConfig;
}
