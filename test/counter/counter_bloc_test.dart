import 'package:bloc_learning/counter/counter_bloc.dart';
import 'package:bloc_learning/counter/counter_event.dart';
import 'package:bloc_learning/counter/counter_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Test Counter Bloc", () {
    late CounterBloc counterBloc;

    setUp(() {
      counterBloc = CounterBloc();
    });

    test("Initial counter should be 0", () {
      expect(counterBloc.state, CounterState(count: 0));
    });

    blocTest(
      "Emit 1 when increase",
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(IncreaseEvent()),
      expect: () => [CounterState(count: 1)],
    );

    blocTest(
      "Emit -1 when increase",
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(DecreaseEvent()),
      expect: () => [CounterState(count: -1)],
    );
  });
}
