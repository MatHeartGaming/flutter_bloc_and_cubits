import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.square_rounded),
            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estado simple"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            leading: const Icon(Icons.square_rounded),
            title: const Text("Bloc"),
            subtitle: const Text("Gestor de estado compuesto"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/bloc'),
          ),
        ],
      ),
    );
  }
}