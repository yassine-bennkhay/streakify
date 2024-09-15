import 'package:flutter/material.dart';
import 'package:streak_calendar/streak_calendar.dart';

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
    const int numberOfDays = 800;

    return Scaffold(
      appBar: AppBar(title: const Text('Custom Streak Calendar')),
      body: Center(
        child: Column(
          children: [
            StreakWidget(
              numberOfDays: numberOfDays,
              crossAxisCount: 4,
              margin: const EdgeInsets.all(40),
              isDayTargetReachedMap: const {
                0: true,
                1: false,
                2: true,
                5: true,
                10: true,
                99: true,
              },
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
