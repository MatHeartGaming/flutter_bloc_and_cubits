import 'package:blocs_and_cubits/presentation/blocs/counter_cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  static const String name = "CubitCounterScreen";

  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;
    return Scaffold(
      appBar: AppBar(
        //title: Text("Cubit Counter: ${counterState.transactionCount}"),
        title: context.select((CounterCubit value) => 
          Text("Cubit Counter: ${value.state.transactionCount}")
        ),
        actions: [
          IconButton(
              onPressed: () {
                var state = context.read<CounterCubit>();
                state.reset();
              },
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
            onPressed: () => _increaseCounterBy(context, 1),
            child: const Text("+1"),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          //buildWhen: (previous, current) => previous.counter != current.counter,
          builder: (context, state) {
            return Text("Counter value: ${state.counter}");
          },
        ),
      ),
    );
  }
}
