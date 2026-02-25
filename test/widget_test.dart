// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:studio_ghibli/main.dart';

void main() {
  testWidgets('GhibliApp renders HomeScreen', (WidgetTester tester) async {
    await tester.pumpWidget(GhibliApp());

    // We expect the bottom navigation items from HomeScreen to be present.
    expect(find.text('Films'), findsOneWidget);
    expect(find.text('People'), findsOneWidget);
    expect(find.text('Locations'), findsOneWidget);
    expect(find.text('Species'), findsOneWidget);
  });
}
