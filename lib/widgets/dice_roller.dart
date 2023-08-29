import 'package:dice/widgets/dice.dart';
import 'package:flutter/material.dart';
import 'dart:math';

final r = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(BuildContext context) {
    Duration d = Duration(seconds: r.nextInt(1) + 1);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Dice(duration: d),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              d = Duration(seconds: r.nextInt(1) + 1);
            });
          },
          child: const Text('Roll!'),
        ),
      ],
    );
  }
}
