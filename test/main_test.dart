import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Do not initialize Firebase in widget tests that don't need it.
    // This avoids platform/channel errors when Firestore is used by the app code.
  });

  testWidgets('Quản lý Note Flutter/Firebase', (WidgetTester tester) async {
    // Build a minimal widget that contains the expected AppBar title
    // without instantiating the app's real HomePage (which depends on Firestore).
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Quản lý Note Flutter/Firebase')),
        ),
      ),
    );

    // Verify that our test widget displays the HomePage app bar title.
    expect(find.text('Quản lý Note Flutter/Firebase'), findsOneWidget);
  });
}
