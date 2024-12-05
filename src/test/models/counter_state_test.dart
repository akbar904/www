
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_app_multiply_by_10/models/counter_state.dart';

void main() {
	group('CounterState Model Tests', () {
		test('CounterState constructor initializes with the given counter value', () {
			final counterState = CounterState(10);
			expect(counterState.counter, 10);
		});

		test('CounterState counter value can be accessed', () {
			final counterState = CounterState(20);
			expect(counterState.counter, 20);
		});
	});
}
