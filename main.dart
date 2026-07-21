import 'package:flutter/material.dart';

void main() {
  runApp(const StudentResultApp());
}

// Main Application
class StudentResultApp extends StatelessWidget {
  const StudentResultApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Result System',
      home: StudentResultScreen(),
    );
  }
}

// Main Screen
class StudentResultScreen extends StatefulWidget {
  @override
  State<StudentResultScreen> createState() => _StudentResultScreenState();
}

class _StudentResultScreenState extends State<StudentResultScreen> {

  // Controller for Student Name
  final TextEditingController nameController = TextEditingController();

  // Controllers for Subject Marks
  final TextEditingController subject1Controller = TextEditingController();
  final TextEditingController subject2Controller = TextEditingController();
  final TextEditingController subject3Controller = TextEditingController();

  // Variables to store result
  double total = 0;
  double percentage = 0;
  String grade = "";
  String status = "";

  // Function to calculate total marks
  double calculateTotal(List<double> marks) {
    double sum = 0;

    // Loop to add all marks
    for (double mark in marks) {
      sum += mark;
    }

    return sum;
  }

  // Function to calculate percentage
  double calculatePercentage(double totalMarks) {
    return (totalMarks / 300) * 100;
  }

  // Function to calculate grade
  String calculateGrade(double per) {
    if (per >= 80) {
      return "A";
    } else if (per >= 70) {
      return "B";
    } else if (per >= 60) {
      return "C";
    } else {
      return "Fail";
    }
  }

  // Function called when button is pressed
  void calculateResult() {

    // Store marks in List
    List<double> marks = [
      double.tryParse(subject1Controller.text) ?? 0,
      double.tryParse(subject2Controller.text) ?? 0,
      double.tryParse(subject3Controller.text) ?? 0,
    ];

    // Call Functions
    total = calculateTotal(marks);
    percentage = calculatePercentage(total);
    grade = calculateGrade(percentage);

    // Check Pass or Fail
    status = grade == "Fail" ? "Failed" : "Passed";

    // Refresh UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Student Result Management System"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // Student Name
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Subject 1
            TextField(
              controller: subject1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Subject 1 Marks",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Subject 2
            TextField(
              controller: subject2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Subject 2 Marks",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Subject 3
            TextField(
              controller: subject3Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Subject 3 Marks",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            // Calculate Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calculateResult,
                child: const Text("Calculate Result"),
              ),
            ),

            const SizedBox(height: 25),

            // Result Card
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text(
                      "Student Name: ${nameController.text}",
                      style: const TextStyle(fontSize: 18),
                    ),

                    const SizedBox(height: 10),

                    Text("Total Marks: $total / 300"),

                    Text(
                        "Percentage: ${percentage.toStringAsFixed(2)}%"),

                    Text("Grade: $grade"),

                    Text("Status: $status"),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
