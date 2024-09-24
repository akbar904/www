
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:counter_app_multiply_by_10/main.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('MyApp', () {
		testWidgets('renders CounterScreen', (tester) async {
			await tester.pumpWidget(MyApp());
			expect(find.byType(CounterScreen), findsOneWidget);
		});
	});

	group('CounterCubit', () {
		late CounterCubit counterCubit;
		
		setUp(() {
			counterCubit = MockCounterCubit();
		});

		blocTest<CounterCubit, int>(
			'emits [10] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [10],
		);

		blocTest<CounterCubit, int>(
			'emits [-10] when decrement is called',
			build: () => counterCubit,
			act: (cubit) => cubit.decrement(),
			expect: () => [-10],
		);

		blocTest<CounterCubit, int>(
			'emits [0] when reset is called',
			build: () => counterCubit,
			act: (cubit) => cubit.reset(),
			expect: () => [0],
		);
	});
}
