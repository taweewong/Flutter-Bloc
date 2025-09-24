import 'package:bloc_learning/counter/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(CounterState(count: 0)) {

    on<IncreaseEvent>((event, emit) {
      emit(state.copyWith(value: state.count + 1));
    });

    on<DecreaseEvent>((event, emit) {
      emit(state.copyWith(value: state.count - 1));
    });

  }
}
