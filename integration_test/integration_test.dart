import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:spitch_mobile/main.dart' as app;

Future<void> addDelay(int ms) async {
  await Future<void>.delayed(Duration(milliseconds: ms));
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  testWidgets('show dialog and close', (tester) async {
    await app.main();
    await tester.pumpAndSettle(const Duration(3000.ms));

    final buttonDialog = find.byKey('simple_dialog_key_button');
    expect(buttonDialog, findsOneWidget);

    await tester.tap(buttonDialog);
    await tester.pumpAndSettle();

    final alertDialog = find.byKey('alert_dialog');
    expect(alertDialog, findsOneWidget);
  });
}
