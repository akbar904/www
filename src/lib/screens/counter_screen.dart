
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.counter_app_multiply_by_10/cubits/counter_cubit.dart';
import 'package:com.example.counter_app_multiply_by_10/widgets/counter_display.dart';

class CounterScreen extends StatelessWidget {
	const CounterScreen({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Counter App'),
			),
			body: Center(
				child: BlocBuilder<CounterCubit, int>(
					builder: (context, state) {
						return CounterDisplay(counter: state);
					},
				),
			),
			floatingActionButton: Column(
				mainAxisAlignment: MainAxisAlignment.end,
				children: [
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().increment(),
						tooltip: 'Increment by 10',
						child: const Icon(Icons.add),
					),
					const SizedBox(height: 8),
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().decrement(),
						tooltip: 'Decrement by 10',
						child: const Icon(Icons.remove),
					),
					const SizedBox(height: 8),
					FloatingActionButton(
						onPressed: () => context.read<CounterCubit>().reset(),
						tooltip: 'Reset',
						child: const Icon(Icons.refresh),
					),
				],
			),
		);
	}
}
