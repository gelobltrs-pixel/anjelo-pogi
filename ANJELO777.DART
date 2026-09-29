
import 'dart:io';

// ABSTRACT & INHERITANCE
abstract class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  set name(String value) {
    if (value.trim().isNotEmpty) {
      _name = value;
    }
  }

  int get age => _age;
  set age(int value) {
    if (value > 0) {
      _age = value;
    }
  }

  void displayDetails();
}

// !! INHERITANCE (student will get values from Person(Abstract)
class Student extends Person {
  final int _id;
  String _course;
  double _gwa;

  // Make constructor for student
  Student({
    required int id,
    required String name,
    required int age,
    required String course,
    required double gwa,
  })  : _id = id,
        _course = course,
        _gwa = gwa,
        super(name, age);

  int get id => _id;

  String get course => _course;
  set course(String value) {
    if (value.trim().isNotEmpty) {
      _course = value;
    }
  }

  double get gwa => _gwa;
  set gwa(double value) {
    _gwa = value;
  }

  // !! POLYMORPHISM
  @override
  void displayDetails() {
    print("---------------------------");
    print("ID (Primary Key) : $_id");
    print("NAME             : $name");
    print("AGE              : $age");
    print("COURSE           : $_course");
    print("GWA              : $_gwa");
  }
}

// !! ENCAPSULATION(This the encapsulation of my functions, instead of making many voids/class)
class StudentManager {

  // for unique ID, for deleting purposes
  static int _studentIdCounter = 1;
  final List<Student> _students = [];

  // 1. Add Student
  void addStudent() {
    print("RUNNING: ADD STUDENT");
    stdout.write("Your Name: ");
    String? name = stdin.readLineSync();

    stdout.write("Your Age: ");
    String ageInput = stdin.readLineSync()!;
    int? age = int.tryParse(ageInput);

    if (name == null || name.trim().isEmpty || age == null || age <= 0) {
      print("Error: Empty or invalid Name/Age.");
      return;
    }

    stdout.write("Your course: ");
    String? course = stdin.readLineSync();

    stdout.write("Your Gwa (must be decimal): ");
    String gwaInput = stdin.readLineSync()!;
    double? gwa = double.tryParse(gwaInput);

    if (course == null || course.trim().isEmpty || gwa == null) {
      print("Error: Invalid Course or GWA (must be decimal).");
      return;
    }

    // Instantiating Student Object
    Student newStudent = Student(
      id: _studentIdCounter,
      name: name,
      age: age,
      course: course,
      gwa: gwa,
    );

    _students.add(newStudent);
    print("Student Added Successfully! (Assigned ID: $_studentIdCounter)");
    _studentIdCounter++;
  }

  // 2. View Student List
  void viewStudents() {
    print("RUNNING: VIEW STUDENTS");
    if (_students.isEmpty) {
      print("Warning: Oops... nothing to view here. Please add a student first.");
      return;
    }

    for (Student student in _students) {
      student.displayDetails();
    }
    print("---------------------------");
  }

  // 3. Update Student
  void updateStudent() {
    print("RUNNING: UPDATE STUDENT");
    if (_students.isEmpty) {
      print("Warning: Oops... nothing to update here. Please add a student first.");
      return;
    }

    stdout.write("Enter the ID (Primary Key) to Update: ");
    String idInput = stdin.readLineSync()!;
    int? searchId = int.tryParse(idInput);

    if (searchId == null) {
      print("Error: Invalid ID format.");
      return;
    }

    Student? studentToUpdate;
    for (var student in _students) {
      if (student.id == searchId) {
        studentToUpdate = student;
        break;
      }
    }

    if (studentToUpdate == null) {
      print("Error: Student with ID $searchId does not exist.");
      return;
    }

    print("\n--- Updating ID: ${studentToUpdate.id} (Leave blank and press Enter to SKIP) ---");

    stdout.write("Update Name [Current: ${studentToUpdate.name}]: ");
    String? nameInput = stdin.readLineSync();
    if (nameInput != null && nameInput.trim().isNotEmpty) {
      studentToUpdate.name = nameInput;
    }

    stdout.write("Update Age [Current: ${studentToUpdate.age}]: ");
    String ageInput = stdin.readLineSync()!;
    if (ageInput.trim().isNotEmpty) {
      int? parsedAge = int.tryParse(ageInput);
      if (parsedAge != null && parsedAge > 0) {
        studentToUpdate.age = parsedAge;
      } else {
        print("Invalid Age. Please try again");
      }
    }

    stdout.write("Update Course [Current: ${studentToUpdate.course}]: ");
    String? courseInput = stdin.readLineSync();
    if (courseInput != null && courseInput.trim().isNotEmpty) {
      studentToUpdate.course = courseInput;
    }

    stdout.write("Update GWA [Current: ${studentToUpdate.gwa}]: ");
    String gwaInput = stdin.readLineSync()!;
    if (gwaInput.trim().isNotEmpty) {
      double? parsedGwa = double.tryParse(gwaInput);
      if (parsedGwa != null) {
        studentToUpdate.gwa = parsedGwa;
      } else {
        print("Invalid GWA. Please try again");
      }
    }

    print("Information Updated!");
  }

  // 4. Delete Student
  void deleteStudent() {
    print("RUNNING: DELETE STUDENT");
    if (_students.isEmpty) {
      print("Warning: Oops... nothing to delete here. Please add a student first.");
      return;
    }

    stdout.write("Enter the ID (Primary Key) to Delete: ");
    String idInput = stdin.readLineSync()!;
    int? searchId = int.tryParse(idInput);

    if (searchId == null) {
      print("Error: Invalid ID format.");
      return;
    }

    int index = _students.indexWhere((s) => s.id == searchId);

    if (index == -1) {
      print("Error: Student with ID $searchId does not exist.");
      return;
    }

    _students.removeAt(index);
    print("Student Deleted!");
  }

  // 0. Search Student
  void searchStudent() {
    print("RUNNING: SEARCH STUDENT");
    if (_students.isEmpty) {
      print("Error: Oops... nothing to view here. Please add a student first.");
      return;
    }

    while (true) {
      stdout.write("Enter the Name of student to search: ");
      String? searchName = stdin.readLineSync();

      if (searchName == null || searchName.trim().isEmpty) {
        print("Error: Name input cannot be empty. Please try again.\n");
        continue;
      }

      Student? foundStudent;
      for (var student in _students) {
        if (student.name.toLowerCase().trim() == searchName.toLowerCase().trim()) {
          foundStudent = student;
          break;
        }
      }

      if (foundStudent == null) {
        print("Error: Student named '$searchName' does not exist. Please try again.\n");
      } else {
        print("\n-------- STUDENT FOUND ---------");
        foundStudent.displayDetails();
        break;
      }
    }
  }

  // 5. Class Average
  void classAverage() {
    print("RUNNING: CLASS AVERAGE");
    if (_students.isEmpty) {
      print("Error: Oops... nothing to see average here. Please add a student first.");
      return;
    }

    double total = 0.0;
    for (Student student in _students) {
      total += student.gwa;
    }

    double average = total / _students.length;
    print("Class Average GWA: ${average.toStringAsFixed(2)}");
  }

  // 6. Student with Highest Grade
  void highestGrade() {
    print("RUNNING: VIEW HIGHEST STUDENT");
    if (_students.isEmpty) {
      print("Error: Oops... nothing to view here. Please add a student first.");
      return;
    }

    Student highest = _students[0];
    for (Student student in _students) {
      if (student.gwa < highest.gwa) {
        highest = student;
      }
    }

    print("---------------------------");
    print("Student with Highest Grade:");
    highest.displayDetails();
  }

  // 7. Student with Lowest Grade
  void lowestGrade() {
    print("RUNNING: VIEW LOWEST STUDENT");
    if (_students.isEmpty) {
      print("Error: Oops... nothing to view here. Please add a student first.");
      return;
    }

    Student lowest = _students[0];
    for (Student student in _students) {
      if (student.gwa > lowest.gwa) {
        lowest = student;
      }
    }

    print("---------------------------");
    print("Student with Lowest Grade:");
    lowest.displayDetails();
  }
}

void main() {
  var name = "Escoton, Jay";
  const course = "BSIT";
  var yearLevel = 3;
  final school = "GRC";

  print("=========================");
  print("      STUDENT PROFILE    ");
  print("=========================");
  print("Name   : $name");
  print("Course : $course");
  print("Year   : $yearLevel");
  print("School : $school");
  print("=========================\n");

  StudentManager manager = StudentManager();
  bool running = true;

  while (running) {
    print("=========================");
    print("   STUDENT INFO. SYS v2  ");
    print("=========================");
    print("[0] Search Student");
    print("[1] Add Student");
    print("[2] View Student List");
    print("[3] Update Student");
    print("[4] Delete Student");
    print("[5] Class Average");
    print("[6] Student w/ Highest Grade");
    print("[7] Student w/ Lowest Grade");
    print("[8] Exit");

    stdout.write("ENTER YOUR CHOICE: ");
    String choiceInput = stdin.readLineSync()!;
    int? choice = int.tryParse(choiceInput);

    if (choice == null) {
      print("Error: Invalid input. Please choose between [0 - 8] only: ");
      continue;
    }

    switch (choice) {
      case 0:
        manager.searchStudent();
        break;
      case 1:
        manager.addStudent();
        break;
      case 2:
        manager.viewStudents();
        break;
      case 3:
        manager.updateStudent();
        break;
      case 4:
        manager.deleteStudent();
        break;
      case 5:
        manager.classAverage();
        break;
      case 6:
        manager.highestGrade();
        break;
      case 7:
        manager.lowestGrade();
        break;
      case 8:
        print("PROGRAM TERMINATED");
        running = false;
        break;
      default:
        print("Error: Invalid input. Please choose between [0 - 8] only: ");
    }
  }
}