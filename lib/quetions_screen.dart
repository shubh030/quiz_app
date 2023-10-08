import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/quetions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuetionsScreen extends StatefulWidget {
  const QuetionsScreen({super.key,required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuetionsScreen> createState() => _QuetionsScreenState();
}

class _QuetionsScreenState extends State<QuetionsScreen> {
  var currentQuestionIndex =0;
  void answerQuestion(String selectedAnswer){

    widget.onSelectAnswer(selectedAnswer);
    setState(() {

      
    currentQuestionIndex ++;
    });
  }
  @override
  Widget build(context) {
  final currentQuestion =quetions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin:const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              currentQuestion.text,
              style:GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ), 
            const SizedBox(
              height: 30,
            ),
      
            ...currentQuestion.getShuffledAmswer().map((answer){
              return AnswerButton(answerText: answer, onTap:(){
                answerQuestion(answer);   
              });
            },),
      
          ],
        ),
      ),
    );
  }
}
