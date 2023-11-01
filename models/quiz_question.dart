class QuizQuestion {
  const QuizQuestion(this.text, this.answers);
  final String text; // this variable is for the questions
  final List<String>
      answers; // karon ekta question r jonno 4/5 ta answer thkbe. Tai list of answers

  List<String> getShuffledAnswers() {
    final shuffleList = List.of(answers);
    shuffleList.shuffle();
    return shuffleList;
  }
}
