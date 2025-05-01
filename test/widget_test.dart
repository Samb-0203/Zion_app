// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_application_1/login_screen.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashScreen displays correctly', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that the SplashScreen displays the expected texts.
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Praise the Lord'), findsOneWidget);

    // Verify that the image is present (using a finder for Image widget).
    expect(find.byType(Image), findsOneWidget);

    // Optionally, simulate the 2-second delay and check navigation.
    await tester.pump(const Duration(seconds: 2)); // Fast-forward the timer
    await tester.pumpAndSettle(); // Wait for navigation to complete

    // Verify that the LoginScreen is now displayed (assuming it has a unique widget).
    // Replace with a finder for a widget unique to LoginScreen.
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
