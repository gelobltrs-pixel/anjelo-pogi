import 'dart:io';

class Student {
  String name;
  String section;
  String course;
  List<double> grades;
  double gwa;

  Student(this.name, this.section, this.course, this.grades)
      : gwa = _computeGWA(grades);

  static double _computeGWA(List<double> grades) {
    if (grades.isEmpty) return 0;
    double sum = grades.reduce((a, b) => a + b);
    return sum / grades.length;
  }
}

int readInt(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    try {
      return int.parse(input!);
    } catch (e) {
      print('Invalid input. Please enter a number.');
    }
  }
}

double readDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    String? input = stdin.readLineSync();
    try {
      return double.parse(input!);
    } catch (e) {
      print('invalid input. Please enter a valid grade (number).');
    }
  }
}

void main() {
  List<Student> students = [];
  bool running = true;

  while (running) {
    print('');
    print('      ||=============================||');
    print('      ||- Student Management System -||');
    print('      ||=============================||');
    print('');
    print('      ||=============================||');
    print('      || 1. Add student              ||');
    print('      || 2. View student list        ||');
    print('      || 3. Update student           ||');
    print('      || 4. Delete student           ||');
    print('      || 5. Class average            ||');
    print('      || 6. Student with highest GWA ||');
    print('      || 7. Student with lowest GWA  ||');
    print('      || 8. Exit                     ||');
    print('      ||=============================||');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter student name: ');
        String name = stdin.readLineSync()!;
        stdout.write('Enter section: ');
        String section = stdin.readLineSync()!;
        stdout.write('Enter course: ');
        String course = stdin.readLineSync()!;

        List<double> grades = [];
        for (int i = 0; i < 5; i++) {
          grades.add(readDouble('Enter grade for subject ${i + 1}: '));
        }

        students.add(Student(name, section, course, grades));
        print('student added!');
        break;

      case '2':
        if (students.isEmpty) {
          print('No students found.');
        } else {
          print('\n--- Student List ---');
          print('Total students: ${students.length}');
          for (int i = 0; i < students.length; i++) {
            print('${i + 1}. ${students[i].name} | Section: ${students[i].section} | Course: ${students[i].course}');
            print('   Grades: ${students[i].grades} | GWA: ${students[i].gwa}');
          }
        }
        break;

      case '3':
  if (students.isEmpty) {
    print('No students to update.');
  } else {
    print('\n--- Update Student ---');
    print('Total students: ${students.length}');
    for (int i = 0; i < students.length; i++) {
      print('${i + 1}. ${students[i].name} | Section: ${students[i].section} | Course: ${students[i].course}');
    }
    print('0. Go back');

    int choice = readInt('Choose a student number to update (0 to go back): ');
    if (choice == 0) {
      print('Going back to main menu...');
      break;
    }

    int index = choice - 1;
    if (index >= 0 && index < students.length) {
      bool updating = true;
      while (updating) {
        print('\nWhat do you want to update for ${students[index].name}?');
        print('1. Name');
        print('2. Section');
        print('3. Course');
        print('4. Grades');
        print('0. Go back');
        String? updateChoice = stdin.readLineSync();

        switch (updateChoice) {
          case '1':
            stdout.write('Enter new name: ');
            students[index].name = stdin.readLineSync()!;
            print('Name updated successfully!');
            break;
          case '2':
            stdout.write('Enter new section: ');
            students[index].section = stdin.readLineSync()!;
            print(' Section updated successfully!');
            break;
          case '3':
            stdout.write('Enter new course: ');
            students[index].course = stdin.readLineSync()!;
            print(' Course updated successfully!');
            break;
          case '4':
            List<double> newGrades = [];
            for (int i = 0; i < 5; i++) {
              newGrades.add(readDouble('Enter new grade for subject ${i + 1}: '));
            }
            students[index].grades = newGrades;
            students[index].gwa = Student._computeGWA(newGrades);
            print(' Grades updated successfully!');
            break;
          case '0':
            updating = false; 
            break;
          default:
            print(' Invalid choice.');
        }
      }
    } else {
      print(' Invalid student number.');
    }
  }
  break;

      case '4':
  if (students.isEmpty) {
    print('No students to delete.');
  } else {
    print('\n--- Delete Student ---');
    print('Total students: ${students.length}');
    for (int i = 0; i < students.length; i++) {
      print('${i + 1}. ${students[i].name} | Section: ${students[i].section} | Course: ${students[i].course}');
    }
    print('0. Go back');

    int choice = readInt('Choose a student number to delete (0 to go back): ');
    if (choice == 0) {
      print('Going back to main menu...');
      break;
    }

    int index = choice - 1;
    if (index >= 0 && index < students.length) {
      print('Are you sure you want to delete ${students[index].name}? (y/n): ');
      String? confirm = stdin.readLineSync();
      if (confirm?.toLowerCase() == 'y') {
        students.removeAt(index);
        print(' Student deleted successfully!');
      } else {
        print('Deletion cancelled.');
      }
    } else {
      print('Invalid student number.');
    }
  }
  break;


      case '5':
  if (students.isEmpty) {
    print('No students to calculate average.');
  } else {
    print('\n--- Class Average ---');


    for (int i = 0; i < students.length; i++) {
      print('${i + 1}. ${students[i].name} | GWA: ${students[i].gwa}');
    }


    double sum = students.fold(0, (prev, s) => prev + s.gwa);
    double classAverage = sum / students.length;
    print('\n Overall Class Average GWA: $classAverage');


    print('\n Highest Grade per Subject:');
    for (int subjectIndex = 0; subjectIndex < 5; subjectIndex++) {
      Student topStudent = students.reduce((a, b) =>
          a.grades[subjectIndex] > b.grades[subjectIndex] ? a : b);
      print('Subject ${subjectIndex + 1}: ${topStudent.name} - ${topStudent.grades[subjectIndex]}');
    }
  }
  break;


      case '6':
        if (students.isEmpty) {
          print('No students found.');
        } else {
          Student top = students.reduce((a, b) => a.gwa > b.gwa ? a : b);
          print(' Highest GWA: ${top.name} | GWA: ${top.gwa}');
        }
        break;

      case '7':
        if (students.isEmpty) {
          print('No students found.');
        } else {
          Student low = students.reduce((a, b) => a.gwa < b.gwa ? a : b);
          print('Lowest GWA: ${low.name} | GWA: ${low.gwa}');
        }
        break;

      case '8':
        print(' Exiting program...');
        running = false;
        break;

      default:
        print(' Invalid choice. Please try again.');
    }
  }
}