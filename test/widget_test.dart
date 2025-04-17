import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:ujicoba/main.dart';
import 'package:ujicoba/zodiac_provider.dart';

void main() {
  testWidgets('Zodiac App smoke test', (WidgetTester tester) async {
    // Build the app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ZodiacProvider()),
        ],
        child: ZodiacApp(),
      ),
    );

    // Verify input field and button exist
    expect(find.text('Nama'), findsOneWidget);
    expect(find.text('Lihat Zodiak'), findsOneWidget);
  });
}

