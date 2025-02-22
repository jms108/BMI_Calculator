import 'package:flutter/material.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _feetController = TextEditingController();
  final TextEditingController _inchesController = TextEditingController();

  void _calculateBMI() {
    double weight = double.tryParse(_weightController.text) ?? 0;
    int feet = int.tryParse(_feetController.text) ?? 0;
    int inches = int.tryParse(_inchesController.text) ?? 0;

    if (weight > 0 && (feet > 0 || inches > 0)) {
      // Convert total height to meters
      double totalInches = ((feet * 12) + inches) as double;
      double heightInMeters = totalInches * 0.0254;

      // Calculate BMI
      double bmi = weight / (heightInMeters * heightInMeters);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(bmi: bmi),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo2.webp', // Path to your image
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
              fit: BoxFit.cover, // Adjust fit as needed
            ),
            SizedBox(height: 40),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _feetController,
                    decoration: InputDecoration(
                      labelText: 'Height (feet)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _inchesController,
                    decoration: InputDecoration(
                      labelText: 'Height (inches)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text(
                'Calculate',
                style: TextStyle(
                    color: Color.fromARGB(255, 85, 1, 115),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
