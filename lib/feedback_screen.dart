import 'package:flutter/material.dart';
import 'success_screen.dart';
import 'statistics_screen.dart';
import 'instructions_screen.dart';
import 'package:intl/intl.dart'; // 시간 형식화를 위한 패키지

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<Map<String, dynamic>> emojiFeedback = [];
  final messageController = TextEditingController();

  void submitFeedback(String emoji) {
    setState(() {
      emojiFeedback.add({
        'emoji': emoji,
        'message': messageController.text,
        'timestamp': DateTime.now(),
      });
      messageController.clear();
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SuccessScreen(
          emojiFeedback: emojiFeedback,
          badgeLevel: 1,
          onViewStatistics: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StatisticsScreen(emojiFeedback: emojiFeedback),
            ),
          ),
        ),
      ),
    );
  }

  // 날짜 및 시간 형식 설정
  String formatTimestamp(DateTime timestamp) {
    return DateFormat('yyyy-MM-dd HH:mm').format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Live Feedback - Taejae Class',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How do you feel?',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Text('😊', style: TextStyle(fontSize: 32)),
                  onPressed: () => submitFeedback('😊'),
                ),
                IconButton(
                  icon: Text('😕', style: TextStyle(fontSize: 32)),
                  onPressed: () => submitFeedback('😕'),
                ),
                IconButton(
                  icon: Text('😢', style: TextStyle(fontSize: 32)),
                  onPressed: () => submitFeedback('😢'),
                ),
                IconButton(
                  icon: Text('🤔❓', style: TextStyle(fontSize: 32)),
                  onPressed: () => submitFeedback('🤔❓'),
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Any specific feedback?',
                labelStyle: TextStyle(color: Colors.blue[800], fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: emojiFeedback.length,
                itemBuilder: (context, index) {
                  final feedback = emojiFeedback[index];
                  return ListTile(
                    leading: Text(
                      feedback['emoji'],
                      style: TextStyle(fontSize: 24),
                    ),
                    title: Text(
                      feedback['message'].isNotEmpty ? feedback['message'] : 'No additional comments',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      formatTimestamp(feedback['timestamp']),
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[600],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InstructionsScreen()),
                );
              },
              child: Text(
                'Instructions',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
