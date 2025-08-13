import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_examples/examples/example1.dart';
import 'package:riverpod_examples/examples/example2.dart';
import 'package:riverpod_examples/examples/example3.dart';
import 'package:riverpod_examples/examples/example4.dart';
import 'package:riverpod_examples/examples/example5.dart';
import 'package:riverpod_examples/examples/example6.dart';

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      {'title': 'Example 1', 'widget': const Example1()},
      {'title': 'Example 2', 'widget': const Example2()},
      {'title': 'Example 3', 'widget': const Example3()},
      {'title': 'Example 4', 'widget': const Example4()},
      {'title': 'Example 5', 'widget': const Example5()},
      {'title': 'Example 6', 'widget': const Example6()},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Riverpod Examples')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => screens[index]['widget'] as Widget,
                  ),
                );
              },
              child: Text(screens[index]['title'] as String),
            ),
          );
        },
      ),
    );
  }
}