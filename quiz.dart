import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuuizState();
  }
}

class _QuuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  // void switchScreen() {
  //   setState(() {
  //     activeScreen = const QuestionScreen();
  //   });
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answers) {
    selectedAnswers.add(answers);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // jkn i last question ashbe ei activeScreen k change kore dbo result screen
      });
    }
  }

  void reStartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(selectedAnswers, reStartQuiz);

      // activeScreen jdi results-screen hoi then screenWidge r value r mdhe ResultsScreen() widget pass korbo
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 66, 8, 166),
                Color.fromARGB(255, 113, 81, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
