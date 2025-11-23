// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart';
import 'package:myapp/views/styled_button.dart';

void main() {
  testWidgets('Add to Cart button is disabled when quantity is 0', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Verify that the Add to Cart button is disabled.
    final buttonFinder = find.ancestor(
        of: find.text('Add to Cart'), matching: find.byType(StyledButton));
    expect(buttonFinder, findsOneWidget);
    final StyledButton button = tester.widget(buttonFinder);
    expect(button.onPressed, isNull);
  });

  testWidgets('Add to Cart button is enabled when quantity is > 0', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    // Tap the '+' icon to increase the quantity.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that the Add to Cart button is enabled.
    final buttonFinder = find.ancestor(
        of: find.text('Add to Cart'), matching: find.byType(StyledButton));
    expect(buttonFinder, findsOneWidget);
    final StyledButton button = tester.widget(buttonFinder);
    expect(button.onPressed, isNotNull);
  });
}
