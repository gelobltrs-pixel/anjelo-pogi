
import 'dart:io';

class Student {
  String name;
  int age;
  String course;
  double gwa;

  Student(this.name, this.age, this.course, this.gwa);
}

void main() {
  List<Student> students = [];

  while (true) {
    print("\n0. SEARCH STUDENT");
    print("1. ADD STUDENT");
    print("2. VIEW STUDENT LIST");
    print("3. UPDATE STUDENT");
    print("4. DELETE STUDENT");
    print("5. CLASS AVERAGE");
    print("6. STUDENT WITH HIGHEST GRADE");
    print("7. STUDENT WITH LOWEST GRADE");
    print("8. EXIT");
    stdout.write("Choose: ");
    String? choice = stdin.readLineSync();

    if (choice == '8') {
      print("OKAY, BYE!");
      break;
    }

    switch (choice) {
      case '0':
        stdout.write("ENTER STUDENT NAME: ");
        String searchName = stdin.readLineSync() ?? "";
        var found = students
            .where((s) => s.name.toLowerCase() == searchName.toLowerCase())
            .toList();

        if (found.isEmpty) {
          print("\nWAG NA HANAPIN ANG WALA!");
        } else {
          for (var s in found) {
            print("\nName: ${s.name}\nAge: ${s.age}\nCourse: ${s.course}\nGWA: ${s.gwa}");
          }
        }
        break;

      case '1':
        print("-------1. ADD STUDENT-------");
        stdout.write("STUDENT NAME: ");
        String name = stdin.readLineSync() ?? "";

        stdout.write("AGE: ");
        int age = int.tryParse(stdin.readLineSync() ?? "0") ?? 0;

        stdout.write("STUDENT COURSE: ");
        String course = stdin.readLineSync() ?? "";

        stdout.write("GWA: ");
        double gwa = double.tryParse(stdin.readLineSync() ?? "0.0") ?? 0.0;

        students.add(Student(name, age, course, gwa));
        print("\nSTUDENT SUCCESSFULLY ADDED TO THE LIST\n");
        print("NAME: $name");
        print("AGE: $age");
        print("COURSE: $course");
        print("GWA: $gwa\n");
        break;

      case '2':
        print("-------2. VIEW STUDENT LIST-------");
        stdout.write("ENTER STUDENT NAME: ");
        String searchName = stdin.readLineSync() ?? "";
        var found = students
            .where((s) => s.name.toLowerCase() == searchName.toLowerCase())
            .toList();

        if (students.isEmpty) {
          print("\nHINAHANAP ANG WALA!");
        } else {
          for (var s in students) {
            print("\nName: ${s.name}\nAge: ${s.age}\nCourse: ${s.course}\nGWA: ${s.gwa}");
          }
        }
        break;

      case '3':
        print("-------3. UPDATE STUDENT-------");
        stdout.write("ENTER NAME: ");
        String updateName = stdin.readLineSync() ?? "";
        int index = students.indexWhere(
            (s) => s.name.toLowerCase() == updateName.toLowerCase());

        if (index != -1) {
          print("ENTER STUDENT INFORMATION ${students[index].name}");

          stdout.write("AGE: ");
          String newAgeInput = stdin.readLineSync() ?? "";
          if (newAgeInput.isNotEmpty) {
            students[index].age = int.parse(newAgeInput);
          }

          stdout.write("COURSE: ");
          String newCourse = stdin.readLineSync() ?? "";
          if (newCourse.isNotEmpty) {
            students[index].course = newCourse;
          }

          stdout.write("GWA: ");
          String newGwaInput = stdin.readLineSync() ?? "";
          if (newGwaInput.isNotEmpty) {
            students[index].gwa = double.parse(newGwaInput);
          }

          print("STUDENT UPDATED!");
        } else {
          print("SINO BA YAN??");
        }
        break;

      case '4':
        print("-------4. DELETE STUDENT-------");
        stdout.write("ENTER STUDENT NAME: ");
        String deleteName = stdin.readLineSync() ?? "";

        int initialLength = students.length;
        students.removeWhere(
            (s) => s.name.toLowerCase() == deleteName.toLowerCase());

        if (students.length < initialLength) {
          print("STUDENT INFORMATION HAS BEEN DELETED");
        } else {
          print("SINO BA YAN??");
        }
        break;

      case '5':
        print("-------5. CLASS AVERAGE-------");
        if (students.isEmpty) {
          print("NO LIST NGANII!");
        } else {
          double totalGwa = 0;
          for (var s in students) {
            totalGwa += s.gwa;
          }
          double average = totalGwa / students.length;
          print("\nCLASS AVERAGE: ${average.toStringAsFixed(2)}");
        }
        break;

      case '6':
        print("-------6. STUDENT WITH THE HIGHEST GRADE-------");
        if (students.isEmpty) {
          print("NO LIST NGANII!");
        } else {
          Student bestStudent = students.reduce(
              (curr, next) => curr.gwa > next.gwa ? curr : next);
          print("\nSTUDENT WITH HIGHEST GRADE:");
          print("NAME: ${bestStudent.name}, GWA: ${bestStudent.gwa}");
        }
        break;

      case '7':
        print("-------7. STUDENT WITH THE LOWEST GRADE-------");
        if (students.isEmpty) {
          print("NO LIST NGANII!");
        } else {
          Student worstStudent = students.reduce(
              (curr, next) => curr.gwa < next.gwa ? curr : next);
          print("\nSTUDENT WITH THE LOWEST GRADE:");
          print("NAME: ${worstStudent.name}, GWA: ${worstStudent.gwa}");
        }
        break;

      default:
        print("BAHALA KA!");
    }
  }
}
