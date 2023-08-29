import 'dart:math';

import 'package:flutter/material.dart';

final r = Random();

Stream<int> generateInts(Duration interval, Duration duration) async* {
  final endTime = DateTime.now().add(duration);
  int value = r.nextInt(6) + 1;

  while (DateTime.now().isBefore(endTime)) {
    await Future.delayed(interval);
    value = r.nextInt(6) + 1;
    yield value;
  }
}

class Dice extends StatefulWidget {
  Dice({super.key, required this.duration});

  final Map<int, Image> faces = {
    1: Image.asset(
      'assets/images/dice-1.png',
      width: 200,
      height: 200,
      key: const ValueKey(1),
    ),
    2: Image.asset(
      'assets/images/dice-2.png',
      width: 200,
      height: 200,
      key: const ValueKey(2),
    ),
    3: Image.asset(
      'assets/images/dice-3.png',
      width: 200,
      height: 200,
      key: const ValueKey(3),
    ),
    4: Image.asset(
      'assets/images/dice-4.png',
      width: 200,
      height: 200,
      key: const ValueKey(4),
    ),
    5: Image.asset(
      'assets/images/dice-5.png',
      width: 200,
      height: 200,
      key: const ValueKey(5),
    ),
    6: Image.asset(
      'assets/images/dice-6.png',
      width: 200,
      height: 200,
      key: const ValueKey(6),
    ),
  };
  final Duration duration;

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: generateInts(const Duration(milliseconds: 150), widget.duration),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Transform.rotate(
            angle: r.nextInt(180).toDouble(),
            child: widget.faces[snapshot.data!],
          );
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
