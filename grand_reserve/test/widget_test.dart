import 'package:flutter_test/flutter_test.dart';
import 'package:grand_reserve/main.dart';

void main() {
  testWidgets('App loads and displays Login Screen', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const GrandReserveApp());

    // Verify that the LoginScreen title is present.
    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Sign in to manage your bookings'), findsOneWidget);
  });
}
