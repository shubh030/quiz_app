import 'package:flutter/material.dart';
import 'package:quiz_app/data/quetions.dart';
import 'package:quiz_app/quetions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == quetions.length) {
      setState(() {
        // 

        activeScreen = 'results-screen';
      });
    }
  }
  void restartquiz(){

    setState(() {
      
    selectedAnswers = [];
    activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWigets = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWigets = QuetionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'results-screen') {
      screenWigets = ResultScreen(chooseAnswer: selectedAnswers,onRestart:restartquiz,);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(171, 56, 12, 133),
              Color.fromARGB(200, 53, 3, 138),
            ],
          )),
          child: screenWigets,
        ),
      ),
    );
  }
}
