part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final counterValue;
  const CounterState({required this.counterValue});

  @override
  List<Object> get props => [counterValue];
}

final class CounterInitial extends CounterState {
  CounterInitial({required super.counterValue});
}

class IncrementState extends CounterState {
  final int incresedValue;
  IncrementState(this.incresedValue) : super(counterValue: incresedValue);
}

class DecrementState extends CounterState {
  final int decresedValue;
  DecrementState(this.decresedValue) : super(counterValue: decresedValue);
}
