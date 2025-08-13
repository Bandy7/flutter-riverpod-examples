import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tickerProvider = StreamProvider(
  (ref) => Stream.periodic(
    const Duration(seconds: 1),
    (i) => i + 1,
  ),
);

final namesProvider = Provider<AsyncValue<Iterable<String>>>(
  (ref) {
    final tickerAsync = ref.watch(tickerProvider);

    return tickerAsync.when(
      data: (count) => AsyncValue.data(names.getRange(0, count.clamp(0, names.length))),
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );
  },
);

class Example4 extends ConsumerWidget {
  const Example4({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    final names = ref.watch(namesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Stream Provider')),
      body: names.when(
        data: (names) {
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names.elementAt(index)),
              );
            },
          );
        },
        error: (error, stack) => Center(child: Text('$error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

const names = [
  'Alice',
  'Bob',
  'Charlie',
  'Diana',
  'Ethan',
  'Fiona',
  'George',
  'Hannah',
  'Ian',
  'Julia',
  'Kevin',
  'Laura',
  'Mike',
];