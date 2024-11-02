import 'package:flutter/material.dart';
import 'feedback_screen.dart';

class UserProfileScreen extends StatelessWidget {
  final String username;

  const UserProfileScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        backgroundColor: Colors.blue[800], // Deep blue AppBar
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome, $username!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800], // Main title in dark blue
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                "This is your profile page.",
                style: TextStyle(fontSize: 16, color: Colors.blueGrey[600]), // Descriptive text in soft blue-grey
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700], // Blue background for the button
                  foregroundColor: Colors.white, // White text color
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Go to Feedback',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white, // White background for the screen
    );
  }
}
