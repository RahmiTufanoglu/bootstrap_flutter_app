import 'dart:developer' as debug;

import 'package:logging/logging.dart';

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    debug.log(
      '[${record.level.name}: '
      '${record.loggerName}] '
      '[${record.time.hour}:${record.time.minute}:${record.time.second}] '
      '"${record.message}", '
      'Stacktrace: ${record.stackTrace ?? 'none'}',
    );
  });
}
