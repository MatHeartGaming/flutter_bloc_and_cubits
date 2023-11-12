import 'package:blocs_and_cubits/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  static const String name = "BlocCounterScreen";

  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CounterBloc(),
        child: const _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView();

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    //context.read<CounterBloc>().add(CounterIncreased(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  void _resetCounter(BuildContext context) {
    //context.read<CounterBloc>().add(const ResetCounter());
    context.read<CounterBloc>().resetCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc bloc) =>
            Text("Bloc Counter ${bloc.state.transactionCount}")),
        actions: [
          IconButton(
              onPressed: () => _resetCounter(context),
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => _increaseCounterBy(context, 3),
            child: const Text("+3"),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => _increaseCounterBy(context, 2),
            child: const Text("+2"),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => _increaseCounterBy(context),
            child: const Text("+1"),
          ),
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
            Text("Counter value: ${counterBloc.state.counter}")),
      ),
    );
  }
}
