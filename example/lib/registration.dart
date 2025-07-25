import 'package:example/views/dashboard.dart';
import 'package:example/views/face_recognizer.dart';
import 'package:example/views/face_registration.dart';
import 'package:flutter/material.dart';

class StartRegistrationScreen extends StatelessWidget {
  const StartRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register your face'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Instructional text
              const Text(
                'Follow the instructions to\nregister your face',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Make sure your face is clearly visible and well-lit. Avoid wearing hats or sunglasses.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 12),
              // Avatar / face frame illustration
              Expanded(
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage('assets/face_illustration.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Start Registration Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => FaceRegistrationDetector(),
                        ),
                        (_) => false);
                  },
                  child: const Text('Start Registration'),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DashboardView(),
                    ));
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FaceRecognitionDetector(),
                    ));
                  },
                  child: const Text('Start Recognition'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
