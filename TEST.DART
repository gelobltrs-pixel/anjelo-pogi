import 'dart:io';

void main() {
  
  // stdout.write("Enter your name: ");
  // String? name = stdin.readLineSync();
  // print("NAME: $name\n");

  // stdout.write("Enter your AGE: ");
  // String? age = stdin.readLineSync();
  // print("AGE: $age\n");

  // stdout.write("Enter your COURSE: ");
  // String? course = stdin.readLineSync();
  // print("COURSE: $course\n");

  
  // stdout.write("Enter your GWA (e.g. 1.9, 2.25): ");
  // String? gwaInput = stdin.readLineSync();
  // print("GWA: $gwaInput\n");

  
  // double? gwa = double.tryParse(gwaInput ?? '5.0');

  // if (gwa != null) {
    
  //   if (gwa <= 3.00) {
  //     print("Result: Passed");
  //   } else {
  //     print("Result: Failed");
  //   }

   
  //   if (gwa <= 1.75) {
  //     print("Rating: Excellent");
  //   } else if (gwa <= 2.25) {
  //     print("Rating: Very Good");
  //   } else if (gwa <= 2.75) {
  //     print("Rating: Good");
  //   } else if (gwa <= 3.00) {
  //     print("Rating: Satisfactory");
  //   } else {
  //     print("Rating: Needs Improvement");
  //   }
  // } else {
  //   print("PASS");
  // }


  stdout.write("==========================");
  stdout.write("STUDENT INFORMATION SYSTEM");
  stdout.write("==========================");
  stdout.write("\1 ADD STUDENT");
  stdout.write("\2 VIEW STUDENT");
  stdout.write("\3 UPDATE STUDENT");
  stdout.write("\4 DELETE STUDENT");

  Map<String, String> student = {
"name": "Juan",
"course": "BSIT"
};
//Access value
print(student["name"]);
//Add value
student["school"] = "GRC";
  

  
}


