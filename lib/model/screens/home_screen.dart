import 'package:flutter/material.dart';
import '../constantes.dart';
import '../question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Question> _questions = [
    Question(
      id: '10',
      title: 'question1',
      options: {'faux': false, 'faux': false, 'faux': false, 'vrai': true},
    ),
    Question(
      id: '11',
      title: 'question2',
      options: {'faux': false, 'faux': false, 'faux': false, 'vrai': true},
    ),
    Question(
      id: '12',
      title: 'question3',
      options: {'faux': false, 'faux': false, 'faux': false, 'vrai': true},
    ),
  ];

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        backgroundColor: background,
        shadowColor: Colors.transparent,
      ),
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
            ],
          ),
        ),
        
    floatingActionButton: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: NextButton(),
    ), 
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
