class Formater {
  static String twoDigit(int n) {
    return n.toString().padLeft(2, "0");
  }

  static String calendar(DateTime date) {
    return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year}";
  }

  
}
