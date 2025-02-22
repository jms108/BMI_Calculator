import 'package:flutter/material.dart';
import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.fitness_center, size: 100, color: Colors.blue),
            Image.asset(
              'assets/images/logo.jpg', // Path to your image
              width: 150, // Adjust width as needed
              height: 150, // Adjust height as needed
              fit: BoxFit.cover, // Adjust fit as needed
            ),
            SizedBox(height: 20),
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
