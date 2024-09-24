
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:counter_app_multiply_by_10/cubits/counter_cubit.dart';

void main() {
	group('CounterCubit', () {
		late CounterCubit counterCubit;

		setUp(() {
			counterCubit = CounterCubit();
		});

		tearDown(() {
			counterCubit.close();
		});

		test('initial state is 0', () {
			expect(counterCubit.state.counter, equals(0));
		});

		blocTest<CounterCubit, CounterState>(
			'emit [CounterState(counter: 10)] when increment is called',
			build: () => counterCubit,
			act: (cubit) => cubit.increment(),
			expect: () => [CounterState(counter: 10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emit [CounterState(counter: -10)] when decrement is called',
			build: () => counterCubit,
			act: (cubit) => cubit.decrement(),
			expect: () => [CounterState(counter: -10)],
		);

		blocTest<CounterCubit, CounterState>(
			'emit [CounterState(counter: 0)] when reset is called after increment or decrement',
			build: () => counterCubit,
			act: (cubit) {
				cubit.increment();
				cubit.reset();
			},
			expect: () => [CounterState(counter: 10), CounterState(counter: 0)],
		);

		test('getCounter returns correct counter value', () {
			counterCubit.increment();
			expect(counterCubit.getCounter(), equals(10));
		});
	});
}
