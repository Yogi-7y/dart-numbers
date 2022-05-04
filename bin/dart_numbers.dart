// ignore_for_file: unnecessary_type_check, unused_local_variable

void main(List<String> arguments) {
  _numType();
  _nativeVsWeb();
  _division();
  _test();
  _divideByZero();
}

void _numType() {
  int a = 10;
  // a = 10.0; // Error: A value of type `double` can't be assigned to a variable of type 'int'.

  double b = 10.0;
  print(b is double); // true

  b = 10;
  print(b is double); // true
  print(b is int); // false

  num c = 10.0;
  print(c is double); // true

  c = 10;
  print(c is double); // false
  print(c is int); // true
}

void _nativeVsWeb() {
  print(1 is int); // On Native => true & On Web => true
  print(1 is double); // On Native => false & On Web => true

  print(1.0 is int); // On Native => false & On Web => true
  print(1.0 is double); // On Native => true & On Web => true

  print(1.0); // On Native => 1.0 & On Web => 1

  print(3.14); // On Native => 3.14 & On Web => 3.14
}

void _division() {
  final a = 10 / 2;

  print(a is int); // false
  print(a is double); // true

  final b = 10 / 0;
  print(b == double.infinity); // true

  // final c = 10 ~/ 0; // IntegerDivisionByZeroException
  // IntegerDivisionByZeroException is soon to be deprecated and replaced by UnsupportedError.
}

void _test() {
  const _expectedResult = '0.5 + 0.5 = 1.0';
  const _actualResult = '0.5 + 0.5 = ${0.5 + 0.5}';

  print(
      _expectedResult == _actualResult); // On Native => true & On Web => false

  // Native result: 0.5 + 0.5 = 1.0
  //Web result: 0.5 + 0.5 = 1

  // This is because it removes the trailing zeros on the web.
}

/// Infinity => [double.infinity]
/// -Infinity => [double.negativeInfinity]
/// NaN => [double.nan]
void _divideByZero() {
  print(10 / 0); // Infinity
  // print(10 ~/ 0); // UnsupportedError: Integer division by zero.
  print(-10 / 0); // -Infinity
  print(0 / 0); // NaN
}
