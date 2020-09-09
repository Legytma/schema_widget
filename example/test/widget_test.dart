// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:schema_widget_sample/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Splash screen loading
    expect(
      find.byType(CircularProgressIndicator),
      findsNWidgets(2),
      reason: "Splash screen loading not found",
    );

    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsNothing);

    // Verify that our counter starts at 0.
    expect(
      find.text('You have pushed the button this many times: 0'),
      findsOneWidget,
      reason: "Initial counter state not match",
    );
    expect(
      find.text('You have pushed the button this many times: 1'),
      findsNothing,
      reason: "Found another text that mascarade counter increment result",
    );

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(
      find.text('You have pushed the button this many times: 0'),
      findsNothing,
      reason: "Counter increment not reflected in widget",
    );
    expect(
      find.text('You have pushed the button this many times: 1'),
      findsOneWidget,
      reason: "Not found new counter value",
    );
  });
}
