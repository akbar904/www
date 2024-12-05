
import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
	final int counter;

	const CounterDisplay({Key? key, required this.counter}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return Center(
			child: Text(
				'$counter',
				key: key,
				style: const TextStyle(
					fontSize: 24,
					fontWeight: FontWeight.bold,
				),
			),
		);
	}
}
