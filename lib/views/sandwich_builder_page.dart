import 'package:flutter/material.dart';

class SandwichBuilderPage extends StatelessWidget {
  const SandwichBuilderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Your Sandwich'),
      ),
      body: const Center(
        child: Text('Sandwich Builder Page'),
      ),
    );
  }
}
