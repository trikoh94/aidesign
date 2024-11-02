import 'package:flutter/material.dart';

class InstructionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Instructions')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('How to Use the App', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 16),
            Text(
              'Welcome to the Live Feedback App! Here\'s how you can use it:\n\n'
                  '1. Select an emoji to express how you feel.\n'
                  '2. (Optional) Add a message with your feedback.\n'
                  '3. Click the "Submit" button to send your feedback.\n\n'
                  'You can view your feedback history and statistics on the User Profile screen.\n\n'
                  'Enjoy using the app and let us know if you have any questions!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
