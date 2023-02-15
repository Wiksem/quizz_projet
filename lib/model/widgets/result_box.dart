import 'package:flutter/material.dart';
import '../constantes.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({
    Key? key,
    required this.result,
    required this.questionLength,
  }) : super(key: key);
  final int result;
  final int questionLength;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Result',
              style: TextStyle(color: neutral, fontSize: 22.0),
            ),
            const SizedBox(height: 20.0),
            CircleAvatar(
              child: Text(
                '$result/$questionLength',
                style: TextStyle(fontSize: 30.0),
              ),
              radius: 70.0,
              backgroundColor: result == questionLength
                  ? correct
                  : result < questionLength / 2
                      ? incorrect
                      : result == questionLength / 2
                          ? Colors.yellow
                          : Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}