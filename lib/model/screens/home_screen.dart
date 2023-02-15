import 'dart:developer';

import 'package:flutter/material.dart';
import '../constantes.dart';
import '../question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(id: '10', title: 'question1', options: {
      'faux': false,
      'vrai': true,
      'faux': false,
      'faux': false,
    }),
    Question(id: '11', title: 'question2', options: {
      'faux': false,
      'vrai': true,
      'faux': false,
      'faux': false,
    }),
    Question(id: '12', title: 'question3', options: {
      'faux': false,
      'vrai': true,
      'faux': false,
      'faux': false,
    }),
  ];

  int index = 0;

  int score = 0;

  bool isPressed = false;

  bool isAlreadySelected = false;

  void nextQuestion() {
    if (index == _questions.length - 1) {
      showDialog(
          context: context,
          builder: (ctx) => ResultBox(
                result: score,
                questionLength: _questions.length,
              ));
      return;
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('choissez une réponse'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20.0),
          ),
        );
      }
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score++;
        setState(() {
          isPressed = true;
          isAlreadySelected = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Score: $score',
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ]),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            QuestionWidget(
              question: _questions[index].title,
              indexAction: index,
              totalQuestions: _questions.length,
            ),
            const Divider(color: neutral),
            const SizedBox(height: 25.0),
            for (int i = 0; i < _questions[index].options.length; i++)
              GestureDetector(
                onTap: () => checkAnswerAndUpdate(
                    _questions[index].options.values.toList()[i]),
                child: OptionCard(
                  option: _questions[index].options.keys.toList()[i],
                  color: isPressed
                      ? _questions[index].options.values.toList()[i] == true
                          ? correct
                          : incorrect
                      : neutral,
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: NextButton(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
