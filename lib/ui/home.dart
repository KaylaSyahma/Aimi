import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Hello,\nKayla Syahma',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F3422),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'How would you like to interact with the AI?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F3422),
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                children: [
                  _interactionOption(
                    context,
                    title: 'You: Speech\nAI: Speech',
                    imagePath: 'assets/speech_speech.png',
                  ),
                  const SizedBox(height: 16),
                  _interactionOption(
                    context,
                    title: 'You: Speech\nAI: Text',
                    imagePath: 'assets/speech_text.png',
                  ),
                  const SizedBox(height: 16),
                  _interactionOption(
                    context,
                    title: 'You: Text\nAI: Text',
                    imagePath: 'assets/text_text.png',
                  ),
                  const SizedBox(height: 16),
                  _interactionOption(
                    context,
                    title: 'You: Text\nAI: Speech',
                    imagePath: 'assets/text_speech.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _interactionOption(BuildContext context, {required String title, required String imagePath}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF9BB168)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 56, height: 56),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF4F3422),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Navigate to interaction mode
        },
      ),
    );
  }
}
