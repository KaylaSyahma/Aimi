import 'package:finpro_11/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Kayla Syahma',
                          style: TextStyle(
                            fontSize: 24,
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
                              AssetImage('assets/icons/logo_circle.png'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                // Subjudul
                const Text(
                  textAlign: TextAlign.center,
                  'How would you like to interact with the AI?',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F3422),
                  ),
                ),
                const SizedBox(height: 36),
                _cardOption(context, "You: Speech\nAI: Speech", 'assets/images/card1.svg'),
                const SizedBox(height: 16),
                _cardOption(context, "You: Speech\nAI: Text", 'assets/images/card2.svg'),
                const SizedBox(height: 16),
                _cardOption(context, "You: Text\nAI: Text", 'assets/images/cad3.svg'),
                const SizedBox(height: 16),
                _cardOption(context, "You: Text\nAI: Speech", 'assets/images/cad4.svg'),
                const SizedBox(height: 16),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector _cardOption(BuildContext context, String text, String image) {
    return GestureDetector(
                onTap: () {
                  // Aksi ketika di-tap, pindah ke ChatScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatScreen()),
                  );
                },
                child: Container(
                  // padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        color: const Color(0xFF9BB168), width: 1.5),
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
                       Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4F3422),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SvgPicture.asset(
                          image,
                          // width: 53, // Atur sesuai keinginan
                          // height: 53, // Sesuaikan dengan kotak
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}
