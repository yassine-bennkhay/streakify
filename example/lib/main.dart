import 'package:flutter/material.dart';
import 'package:streakify/streakify_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _tappedIndex;
  @override
  Widget build(BuildContext context) {
    const int numberOfDays = 100;

    return Scaffold(
      appBar: AppBar(title: const Text('Custom Streak Calendar')),
      body: Center(
        child: Column(
          children: [
            StreakifyWidget(
              numberOfDays: numberOfDays,
              crossAxisCount: 4,
              margin: const EdgeInsets.all(40),

              /// The `isDayTargetReachedMap` is a map of day index to a boolean value.
              isDayTargetReachedMap: Map.fromEntries(
                List.generate(
                  numberOfDays,
                  (index) => MapEntry(
                    index,
                    index % 2 == 0 || index % 3 == 0 || index % 5 == 0,
                  ),
                ),
              ),
              height: 100,
              width: 350,
              onTap: (index) {
                setState(() {
                  _tappedIndex = index;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              _tappedIndex != null ? 'Tapped day: ${_tappedIndex! + 1}' : 'Tap a day to see its index',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
