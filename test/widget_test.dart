import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradelock_app/main.dart'; // Ensure this points to where MyApp is defined
import 'package:tradelock_app/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  testWidgets('Onboarding page loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the OnboardingPage is present
    expect(find.byType(OnboardingPage), findsOneWidget);

    // Verify SVG is present
    expect(find.byType(SvgPicture), findsWidgets);

    // Verify initial text from the first slide
    expect(find.text('Secure jobs. Safe payments.'), findsOneWidget);
    expect(find.text('Skip'), findsOneWidget);
  });
}
