class QuizQuetion{
 const QuizQuetion(this.text,this.answers);
  final String text;
  final List<String> answers;
  List<String>getShuffledAmswer(){
    final shuffledList= List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}