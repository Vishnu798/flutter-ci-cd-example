// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ci_cd_example/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('App bar shows correct title', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
  });

  testWidgets('Counter label is displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(
      find.text('You have pushed the button this many times:'),
      findsOneWidget,
    );
  });

  testWidgets('Counter starts at zero', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('Counter increments by 1 on each tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('FAB has Increment tooltip', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);
    expect(
      tester.widget<FloatingActionButton>(fab).tooltip,
      equals('Increment'),
    );
  });

  testWidgets('Counter does not change without a tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.pump();
    expect(find.text('0'), findsOneWidget);
  });
}
