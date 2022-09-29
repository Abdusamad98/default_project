import 'dart:math';

import 'package:flutter/material.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.yellowAccent,
    Colors.green,
  ];

  @override
  Widget build(BuildContext context) {
    final double twoQuarters = MediaQuery.of(context).size.height * (2 / 3);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...List.generate(
            4,
            (index) => getSingleRectangle(twoQuarters, colors[Random().nextInt(4)]),
          ),
        ],
      ),
    );
  }

  Widget getSingleRectangle(double height, Color color) => Container(
        width: double.infinity,
        color: color,
        height: height,
      );
}
