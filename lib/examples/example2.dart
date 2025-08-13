import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Counter extends StateNotifier<int> {
  Counter() : super(0);

  void increment() => state++;
}

final counterProfider = StateNotifierProvider<Counter, int>((ref) => Counter());

class Example2 extends ConsumerWidget {
  const Example2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final counter = ref.watch(counterProfider);

    return Scaffold(
      appBar: AppBar(title: const Text('State Notifier Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Counter Value: ',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  '$counter',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: ref.read(counterProfider.notifier).increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
