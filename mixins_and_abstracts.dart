/// Learning: Mixins and Abstract Classes in Dart
///
/// This file demonstrates:
/// - Using `abstract` classes as interfaces/base types
/// - Declaring and applying `mixin`s
/// - `mixin` constraints using `on`
/// - Combining multiple mixins and calling their functionality

// Abstract base class used by multiple concrete types
abstract class Animal {
  final String name;
  Animal(this.name);

  void speak(); // abstract method

  String describe() => 'I am $name.';
}

// A simple mixin that adds logging capability
mixin Logger {
  void log(String message) => print('[LOG] $message');
}

// A mixin that expects to be mixed on an Animal (so it can access `name`)
mixin Swimmer on Animal {
  void swim() => print('$name is swimming.');
}

// A mixin that doesn't require any particular base type
mixin Flyer {
  void fly() => print('I am flying!');
}

// Concrete classes combining abstract class and mixins
class Bird extends Animal with Flyer, Logger {
  Bird(String name) : super(name);

  @override
  void speak() => print('$name chirps.');
}

class Fish extends Animal with Swimmer, Logger {
  Fish(String name) : super(name);

  @override
  void speak() => print('$name blubs.');
}

class Duck extends Animal with Flyer, Swimmer, Logger {
  Duck(String name) : super(name);

  @override
  void speak() => print('$name quacks.');
}

// Another example: abstract shape + mixin for printable area
abstract class Shape {
  double area();
}

mixin PrettyPrint on Shape {
  void pretty() => print('Area = ${area().toStringAsFixed(2)}');
}

class Circle extends Shape with PrettyPrint {
  final double r;
  Circle(this.r);

  @override
  double area() => 3.141592653589793 * r * r;
}

void main() {
  final bird = Bird('Tweety');
  bird.speak();
  bird.fly();
  bird.log('Bird finished flying');
  print(bird.describe());

  print('');
  final fish = Fish('Nemo');
  fish.speak();
  fish.swim();
  fish.log('Fish swam away');

  print('');
  final duck = Duck('Donald');
  duck.speak();
  duck.fly();
  duck.swim();
  duck.log('Duck did both');

  print('\nShape + mixin example:');
  final c = Circle(2.5);
  c.pretty();
}
