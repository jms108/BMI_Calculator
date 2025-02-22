import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage({required this.bmi});

  String _getBMICategory() {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Normal Weight";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Overweight";
    } else if (bmi >= 30 && bmi < 39.9) {
      return "Obesity";
    } else {
      return "Extreme Obesity";
    }
  }

  String _getBMIMessage() {
    if (bmi < 18.5) {
      return "Your BMI indicates that you are underweight. It is important to maintain a healthy weight for overall well-being. Consider consulting a healthcare professional to discuss your diet and lifestyle.";
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return "Great job! Your BMI is within the normal weight range. Continue to maintain a balanced diet and active lifestyle to stay healthy.";
    } else if (bmi >= 25 && bmi < 29.9) {
      return "Your BMI indicates that you are overweight. It may be beneficial to adopt healthier eating habits and incorporate regular physical activity into your routine. Consider seeking advice from a healthcare professional for personalized guidance.";
    } else if (bmi >= 30 && bmi < 39.9) {
      return "Your BMI falls within the obesity range. It's important to take steps towards a healthier lifestyle. Small changes in diet and physical activity can make a significant difference. Consult a healthcare professional for tailored advice and support.";
    } else {
      return "Your BMI indicates Extremely obesity, which can have serious health implications. It's crucial to seek medical advice to develop a comprehensive plan for achieving a healthier weight. Your healthcare provider can offer the best guidance and support.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your BMI')),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(15),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/bmi.jpg', // Path to your image
                  width: 400, // Adjust width as needed
                  height: 350, // Adjust height as needed
                  //fit: BoxFit.cover, // Adjust fit as needed
                ),
                SizedBox(height: 5),
                Text(
                  'BMI: ${bmi.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 13),
                Text(
                  _getBMICategory(),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 8, 175)),
                ),
                SizedBox(height: 17),
                Text(
                  _getBMIMessage(),
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 5, 23, 38)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
