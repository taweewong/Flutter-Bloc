import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterContent(),
    );
  }
}

class CounterContent extends StatelessWidget {
  const CounterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        CounterBloc bloc = context.read<CounterBloc>();
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(bloc.state.count.toString()),
                TextButton(
                  child: Text("Increase"),
                  onPressed: () {
                    bloc.add(IncreaseEvent());
                  },
                ),
                TextButton(
                  child: Text("Decrease"),
                  onPressed: () {
                    bloc.add(DecreaseEvent());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
