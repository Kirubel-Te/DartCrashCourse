import 'dart:math';

/// Learning: Extension Methods in Dart
///
/// This file demonstrates how to add methods and getters to existing
/// types without modifying their original declarations using extension
/// methods. Examples cover `String`, `int`, `Iterable<T>`, and a
/// user-defined `Point` class.

// 1) Extend String with useful helpers
extension StringExtensions on String {
  /// Returns true if the string is a palindrome (ignores non-alphanumerics)
  bool isPalindrome() {
    final cleaned = toLowerCase().replaceAll(RegExp(r"[^a-z0-9]"), '');
    return cleaned == cleaned.split('').reversed.join();
  }

  /// Wraps the string in double quotes
  String get quoted => '"' + this + '"';
}

// 2) Extend int with iteration and math helpers
extension IntExtensions on int {
  /// Execute [action] this many times, passing the index each time.
  void times(void Function(int index) action) {
    for (var i = 0; i < this; i++) {
      action(i);
    }
  }

  /// Square the integer
  int get squared => this * this;
}

// 3) Extend Iterable<T> with a safe accessor
extension IterableExtensions<T> on Iterable<T> {
  /// Returns the second element or null if it doesn't exist.
  T? secondOrNull() {
    final it = iterator;
    if (!it.moveNext()) return null; // no first
    if (!it.moveNext()) return null; // no second
    return it.current;
  }
}

// 4) Extend a user-defined class
class Point {
  final num x;
  final num y;
  const Point(this.x, this.y);

  @override
  String toString() => 'Point($x, $y)';
}

extension PointExtensions on Point {
  /// Translate by dx/dy returning a new Point
  Point translate(num dx, num dy) => Point(x + dx, y + dy);

  /// Distance to the origin
  double distanceToOrigin() => sqrt(x * x + y * y);
}

void main() {
  // String extensions
  final s = 'A man, a plan, a canal: Panama';
  print('Original: ' + s);
  print('Is palindrome? ' + s.isPalindrome().toString());
  print('Quoted: ' + s.quoted);

  // Int extensions
  print('\nInt.times and squared:');
  3.times((i) => print('  index $i'));
  print('5 squared = ${5.squared}');

  // Iterable<T> extension
  final list = [10, 20, 30];
  print('\nSecond element or null: ${list.secondOrNull()}');
  print('Empty list second: ${<int>[].secondOrNull()}');

  // Point + extension
  final p = Point(3, 4);
  print('\nPoint demo: $p');
  print('Translated: ${p.translate(-1, 2)}');
  print('Distance to origin: ${p.distanceToOrigin()}');
}
