class GreatMathLibrary {

  static int sum(int a, int b) {
    return a + b;
  }

}

enum NumberDescriptor {
  small,
  middle,
  big
}

class NumberHundler {

  NumberDescriptor descriptor(int number) {
    if (number <= 0) {
      throw Exception('Number should be bigger than 0');
    } else if (number < 10) {
      return NumberDescriptor.small;
    } else if (number < 100) {
      return NumberDescriptor.middle;
    } else {
      return NumberDescriptor.big;
    }
  }

}


