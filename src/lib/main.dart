
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubits/counter_cubit.dart';
import 'screens/counter_screen.dart';

class MyApp extends StatelessWidget {
	MyApp();

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Counter App Multiply by 10',
			home: BlocProvider(
				create: (context) => CounterCubit(),
				child: CounterScreen(),
			),
		);
	}
}

void main() {
	runApp(MyApp());
}
