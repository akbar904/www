
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
	CounterCubit() : super(CounterState(counter: 0));

	void increment() {
		emit(CounterState(counter: state.counter + 10));
	}

	void decrement() {
		emit(CounterState(counter: state.counter - 10));
	}

	void reset() {
		emit(CounterState(counter: 0));
	}

	int getCounter() {
		return state.counter;
	}
}

class CounterState extends Equatable {
	final int counter;
	const CounterState({required this.counter});

	@override
	List<Object> get props => [counter];
}
