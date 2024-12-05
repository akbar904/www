
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.counter_app_multiply_by_10/screens/counter_screen.dart';
import 'package:com.example.counter_app_multiply_by_10/cubits/counter_cubit.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit {}

void main() {
	group('CounterScreen Widget Tests', () {
		late MockCounterCubit mockCounterCubit;

		setUp(() {
			mockCounterCubit = MockCounterCubit();
		});

		tearDown(() {
			mockCounterCubit.close();
		});

		testWidgets('renders CounterScreen with initial counter value', (tester) async {
			when(() => mockCounterCubit.state).thenReturn(0);
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			
			expect(find.text('Counter Value: 0'), findsOneWidget);
			expect(find.byType(FloatingActionButton), findsNWidgets(3));
		});

		testWidgets('increments counter value by 10 when increment button is pressed', (tester) async {
			whenListen(mockCounterCubit, Stream.fromIterable([0, 10]), initialState: 0);
			when(() => mockCounterCubit.increment()).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			await tester.tap(find.byIcon(Icons.add));
			await tester.pump();

			verify(() => mockCounterCubit.increment()).called(1);
			expect(find.text('Counter Value: 10'), findsOneWidget);
		});

		testWidgets('decrements counter value by 10 when decrement button is pressed', (tester) async {
			whenListen(mockCounterCubit, Stream.fromIterable([0, -10]), initialState: 0);
			when(() => mockCounterCubit.decrement()).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			await tester.tap(find.byIcon(Icons.remove));
			await tester.pump();

			verify(() => mockCounterCubit.decrement()).called(1);
			expect(find.text('Counter Value: -10'), findsOneWidget);
		});

		testWidgets('resets counter value to 0 when reset button is pressed', (tester) async {
			whenListen(mockCounterCubit, Stream.fromIterable([0, 50, 0]), initialState: 0);
			when(() => mockCounterCubit.reset()).thenAnswer((_) async {});

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider.value(
						value: mockCounterCubit,
						child: CounterScreen(),
					),
				),
			);
			await tester.tap(find.byIcon(Icons.refresh));
			await tester.pump();

			verify(() => mockCounterCubit.reset()).called(1);
			expect(find.text('Counter Value: 0'), findsOneWidget);
		});
	});
}
