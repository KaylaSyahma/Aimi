import 'package:finpro_11/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello,',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kayla Syahma',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.tune, color: Color(0xFF4F3422)),
                          onPressed: () {
                            // Aksi ketika tombol pengaturan ditekan
                          },
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/sample_profile.jpg'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                // Subjudul
                const Text(
                  'How would you like to interact with the AI?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
                const SizedBox(height: 24),
               GestureDetector(
  onTap: () {
    // Aksi ketika di-tap, pindah ke ChatScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  },
  child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF9BB168), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'You: Speech\nAI: Speech',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F3422),
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/speech_speech.png',
            width: 53, // Atur sesuai keinginan
            height: 53, // Sesuaikan dengan kotak
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  ),
),
const SizedBox(height: 16),
GestureDetector(
  onTap: () {
    // Aksi ketika di-tap, pindah ke ChatScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  },
  child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF9BB168), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'You: Speech\nAI: Text',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F3422),
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/speech_text.png',
            width: 36,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  ),
),
const SizedBox(height: 16),
GestureDetector(
  onTap: () {
    // Aksi ketika di-tap, pindah ke ChatScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  },
  child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF9BB168), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'You: Text\nAI: Text',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F3422),
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/text_text.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  ),
),
const SizedBox(height: 16),
GestureDetector(
  onTap: () {
    // Aksi ketika di-tap, pindah ke ChatScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  },
  child: Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: const Color(0xFF9BB168), width: 1.5),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      children: [
        const SizedBox(width: 12),
        const Expanded(
          child: Text(
            'You: Text\nAI: Speech',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F3422),
            ),
          ),
        ),
        Expanded(
          child: Image.asset(
            'assets/images/text_speech.png',
            width: 53,
            height: 53,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  ),
),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
