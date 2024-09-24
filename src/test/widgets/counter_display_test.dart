
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app_multiply_by_10/widgets/counter_display.dart';

void main() {
	group('CounterDisplay Widget Tests', () {
		testWidgets('displays the counter value correctly', (WidgetTester tester) async {
			// Arrange
			const counterValue = 50;
			const counterDisplayKey = Key('counter_display');

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CounterDisplay(key: counterDisplayKey, counter: counterValue),
					),
				),
			);

			// Assert
			expect(find.byKey(counterDisplayKey), findsOneWidget);
			expect(find.text('50'), findsOneWidget);
		});

		testWidgets('displays a default style for the counter value', (WidgetTester tester) async {
			// Arrange
			const counterValue = 100;

			// Act
			await tester.pumpWidget(
				const MaterialApp(
					home: Scaffold(
						body: CounterDisplay(counter: counterValue),
					),
				),
			);

			// Assert
			final textWidget = tester.widget<Text>(find.text('100'));
			expect(textWidget.style, isNotNull);
			expect(textWidget.style?.fontSize, 24);
			expect(textWidget.style?.fontWeight, FontWeight.bold);
		});
	});
}
