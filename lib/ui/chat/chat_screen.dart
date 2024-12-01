import 'package:finpro_11/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:finpro_11/const.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages =
      []; // List untuk menyimpan pesan dan tipe (user/bot)
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      setState(() {
        // Tambahkan pesan pengguna
        _messages.add({'sender': 'user', 'text': text.trim()});
      });
      _messageController.clear();

      // Periksa kata kunci untuk balasan otomatis
      _getAutoResponse(text.trim());
    }
  }

  void _getAutoResponse(String userMessage) {
    String? botResponse;

    // Cek jika ada kata kunci tertentu
    // Cek jika ada kata kunci tertentu
    if (userMessage.contains('sedih') || userMessage.contains('down')) {
      botResponse =
          "Mengapa kamu sedih? kalo kamu mau cerita, aku ada disini kok. atau kamu mau mencoba melakukan ini:\n"
          "- Mendengarkan musik yang kamu suka 🎵\n"
          "- Jalan-jalan sebentar untuk udara segar 🌳\n"
          "- Cerita dengan teman dekatmu 💬\n"
          "- Atau coba menonton komedi untuk tertawa 😂";
    } else if (userMessage.contains('bingung')) {
      botResponse = "Tidak apa-apa merasa bingung! Cobalah untuk:\n"
          "- Tuliskan pikiranmu di atas kertas 📝\n"
          "- Fokus pada satu hal kecil yang bisa kamu selesaikan 💡\n"
          "- Ambil waktu untuk istirahat sejenak.";
    } else if (userMessage.contains('bahagia')) {
      botResponse =
          "Senang mendengar itu! Tetap jaga energi positifmu dan sebarkan kebahagiaan ke sekitarmu! 😊🌟";
    } else if (userMessage.toLowerCase().contains('hai') ||
        userMessage.toLowerCase().contains('halo') ||
        userMessage.toLowerCase().contains('holaa') ||
        userMessage.toLowerCase().contains('haaaii') ||
        userMessage.toLowerCase().contains('hello') ||
        userMessage.toLowerCase().contains('hi')) {
      botResponse = "Hai juga! 😊 Ada yang bisa aku bantu hari ini?";
    } else if (userMessage.contains('marah')) {
      botResponse = "Aku mengerti kamu sedang marah 😤. Cobalah:\n"
          "- Tarik napas dalam-dalam beberapa kali 🧘\n"
          "- Dengarkan musik yang menenangkan 🎶\n"
          "- Jika memungkinkan, luangkan waktu untuk sendiri sejenak.";
    } else if (userMessage.contains('kesel')) {
      botResponse =
          "Kekesalan itu wajar, tapi jangan dibiarkan berlarut-larut ya! Cobalah:\n"
          "- Berjalan-jalan untuk menenangkan pikiran 🌳\n"
          "- Minum teh atau kopi favoritmu ☕\n"
          "- Tulis apa yang membuatmu kesal dan cari solusinya ✍️.";
    } else if (userMessage.contains('moodyan') ||
        userMessage.contains('mood')) {
      botResponse =
          "Mood naik-turun memang bisa menyulitkan, tapi jangan khawatir! Kamu bisa coba:\n"
          "- Mendengarkan playlist favoritmu 🎵\n"
          "- Melakukan hal yang kamu sukai, seperti membaca atau menggambar 🎨\n"
          "- Berbicara dengan teman baikmu 💬.";
    }

    if (botResponse != null) {
      // Tambahkan balasan bot ke list
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _messages.add({'sender': 'bot', 'text': botResponse!});
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F6F6),
        elevation: 1,
        foregroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Text to Text', style: TextStyle(color: Colors.black)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Ready',
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(const Home());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: _messages.map((msg) {
                final isUser = msg['sender'] == 'user';
                return Row(
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      const CircleAvatar(
                        backgroundColor: secondaryColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    if (!isUser) const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: secondaryColor, // Border warna secondary
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          msg['text']!,
                          style: const TextStyle(
                            color: textColor,
                          ),
                        ),
                      ),
                    ),
                    if (isUser) const SizedBox(width: 8),
                    if (isUser)
                      const CircleAvatar(
                        backgroundColor: thirdColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onSubmitted: _sendMessage, // Kirim pesan dengan Enter
                    decoration: InputDecoration(
                      hintText: 'Send a message ...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _sendMessage(_messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
