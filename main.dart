import 'dart:io';

// ------------------------------
// Student Result Management System
// Dart Console Application
// ------------------------------

const int maxMarksPerSubject = 100;
const int totalSubjects = 3;

// Function to calculate total marks
double calculateTotal(List<double> marks) {
  double total = 0;

  for (double mark in marks) {
    total += mark;
  }

  return total;
}

// Function to calculate percentage
double calculatePercentage(double totalMarks) {
  return (totalMarks / (totalSubjects * maxMarksPerSubject)) * 100;
}

// Function to calculate grade
String calculateGrade(double percentage) {
  if (percentage >= 80) {
    return "A";
  } else if (percentage >= 70) {
    return "B";
  } else if (percentage >= 60) {
    return "C";
  } else if (percentage >= 50) {
    return "D";
  } else {
    return "Fail";
  }
}

void main() {
  print("==========================================");
  print("   STUDENT RESULT MANAGEMENT SYSTEM");
  print("==========================================\n");

  // Student Name
  stdout.write("Enter Student Name: ");
  String studentName = stdin.readLineSync() ?? "";

  List<double> marks = [];

  // Input marks using loop
  for (int i = 1; i <= totalSubjects; i++) {
    while (true) {
      try {
        stdout.write("Enter Subject $i Marks (0-100): ");

        String? input = stdin.readLineSync();

        if (input == null || input.isEmpty) {
          throw Exception("Input cannot be empty.");
        }

        double mark = double.parse(input);

        if (mark < 0 || mark > 100) {
          throw Exception("Marks must be between 0 and 100.");
        }

        marks.add(mark);
        break;
      } catch (e) {
        print("Invalid Input! ${e.toString()}");
        print("Please enter again.\n");
      }
    }
  }

  // Calculations
  double total = calculateTotal(marks);
  double percentage = calculatePercentage(total);
  String grade = calculateGrade(percentage);
  String status = grade == "Fail" ? "Failed" : "Passed";

  // Display Result
  print("\n==========================================");
  print("              RESULT CARD");
  print("==========================================");

  print("Student Name : $studentName");

  for (int i = 0; i < marks.length; i++) {
    print("Subject ${i + 1} Marks : ${marks[i]}");
  }

  print("------------------------------------------");
  print("Total Marks : $total / 300");
  print("Percentage  : ${percentage.toStringAsFixed(2)}%");
  print("Grade       : $grade");
  print("Status      : $status");
  print("==========================================");
}
