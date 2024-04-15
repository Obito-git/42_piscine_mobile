enum CalculatorButton {
  seven,
  eight,
  nine,
  clear,
  allClear,
  four,
  five,
  six,
  plus,
  minus,
  one,
  two,
  three,
  multiply,
  divide,
  zero,
  dot,
  doubleZero,
  equals,
}

extension CalculatorButtonExtension on CalculatorButton {
  String get value {
    switch (this) {
      case CalculatorButton.seven:
        return "7";
      case CalculatorButton.eight:
        return "8";
      case CalculatorButton.nine:
        return "9";
      case CalculatorButton.clear:
        return "C";
      case CalculatorButton.allClear:
        return "AC";
      case CalculatorButton.four:
        return "4";
      case CalculatorButton.five:
        return "5";
      case CalculatorButton.six:
        return "6";
      case CalculatorButton.plus:
        return "+";
      case CalculatorButton.minus:
        return "-";
      case CalculatorButton.one:
        return "1";
      case CalculatorButton.two:
        return "2";
      case CalculatorButton.three:
        return "3";
      case CalculatorButton.multiply:
        return "*";
      case CalculatorButton.divide:
        return "/";
      case CalculatorButton.zero:
        return "0";
      case CalculatorButton.dot:
        return ".";
      case CalculatorButton.doubleZero:
        return "00";
      case CalculatorButton.equals:
        return "=";
      default:
        throw ArgumentError("Unknown button");
    }
  }
}
