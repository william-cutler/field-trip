class WritingTask {
  final String prompt;

  String response = "";

  WritingTask(this.prompt);

  void setResponse(String newResponse) {
    this.response = newResponse;
  }

  String toString() {
    return "[" + this.prompt + " : " + this.response + "]";
  }
}
