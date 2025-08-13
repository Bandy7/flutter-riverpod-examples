import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dateTime = Provider<DateTime>((_) {
  return DateTime.now();
});

class Example1 extends ConsumerWidget {
  const Example1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final currentDateTime = ref.watch(dateTime);

    return Scaffold(
      appBar: AppBar(title: const Text('Provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Date and Time:',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              '$currentDateTime',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
