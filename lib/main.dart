import 'package:dice/widgets/dice_roller.dart';
import 'package:flutter/material.dart';

import 'views/gradient_container.dart';

final ThemeData theme = ThemeData().copyWith(
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.deepPurple,
  ),
  useMaterial3: true,
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Scaffold(
        body: GradientContainer(
          colors: [
            Color.fromARGB(255, 83, 47, 147),
            Color.fromARGB(255, 144, 104, 255)
          ],
          child: DiceRoller(),
        ),
      ),
    );
  }
}
