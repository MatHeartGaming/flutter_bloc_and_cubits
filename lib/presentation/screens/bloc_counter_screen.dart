import 'package:flutter/material.dart';

class BlocCounterScreen extends StatelessWidget {
  static const String name = "BlocCounterScreen";

  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubit Counter"),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () => {},
            child: const Text("+3"),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () => {},
            child: const Text("+2"),
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () => {},
            child: const Text("+1"),
          ),
        ],
      ),
      body: const Center(
        child: Text("Counter value: xxxx"),
      ),
    );
  }
}
