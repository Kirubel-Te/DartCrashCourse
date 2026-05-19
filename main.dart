void main() {
  Student student = Student();

  student.speak();
  student.walk();
  student.run();

  Runes emoji = Runes('\u{1F607}');
  print(String.fromCharCodes(emoji));
}

// Person class
class Person {
  void speak() {
    print("Speaking...");
  }
}

// Walk mixin/class
mixin Walk {
  void walk() {
    print("Walking...");
  }
}

// Running mixin/class
mixin Running {
  void run() {
    print("Running...");
  }
}

// Student class inheriting functionality
class Student extends Person with Walk, Running {

  // overriding speak method
  @override
  void speak() {
    print("Student is speaking...");
  }

  // overriding walk method
  @override
  void walk() {
    print("Student is walking...");
  }

  // overriding run method
  @override
  void run() {
    print("Student is running...");
  }
}