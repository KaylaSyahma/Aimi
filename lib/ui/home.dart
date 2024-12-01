import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6), // Background sesuai desain
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Hello,\nKayla Syahma',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4F3422),
              ),
            ),
            // Tombol pengaturan berada di sebelah kanan
            IconButton(
              icon: const Icon(Icons.settings, color: Color(0xFF4F3422)),
              onPressed: () {
                // Aksi ketika tombol pengaturan ditekan
              },
            ),
          ],
        ),
        actions: const [
          // Avatar profil muncul setelah tombol pengaturan
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/sample_profile.jpg'), // Gambar profil
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
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
        border: Border.all(color: const Color(0xFF9BB168), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 56, height: 56), // Gambar ilustrasi AI
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF4F3422),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          // Aksi ketika tombol di-tap
        },
      ),
    );
  }
}
