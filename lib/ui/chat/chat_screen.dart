// import 'package:finpro_11/ui/home.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<String> _messages = [];
//   final TextEditingController _messageController = TextEditingController();

//   void _sendMessage() {
//     if (_messageController.text.trim().isNotEmpty) {
//       setState(() {
//         _messages.add(_messageController.text.trim());
//       });
//       _messageController.clear();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF6F6F6),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         foregroundColor: Colors.black,
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text('Text to Text', style: TextStyle(color: Colors.black)),
//             Text(
//               'Ready',
//               style: TextStyle(
//                 color: Colors.green,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.of(context).pop(const Home());
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.all(16.0),
//               children: [
//                 // Pesan awal dalam bentuk bubble
//                 Row(
//                   children: [
//                     const CircleAvatar(
//                       backgroundColor: Colors.green,
//                       child: Icon(Icons.person, color: Colors.white),
//                     ),
//                     const SizedBox(width: 8),
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 4,
//                           ),
//                         ],
//                       ),
//                       child: const Text(
//                         'Hi, Jerry 😊👋 How\'s your day?',
//                         style: TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 4,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 // Pesan yang dikirim pengguna
//                 ..._messages.map((msg) => Row(
//                       mainAxisAlignment: MainAxisAlignment.end, // Bubble ke kanan
//                       children: [
//                         Flexible(
//                           child: Container(
//                             margin: const EdgeInsets.only(bottom: 8.0),
//                             padding: const EdgeInsets.all(12.0),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(8.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black.withOpacity(0.1),
//                                   blurRadius: 4,
//                                 ),
//                               ],
//                             ),
//                             child: Text(
//                               msg,
//                               style: const TextStyle(color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         const CircleAvatar(
//                           backgroundColor: Colors.blueAccent,
//                           child: Icon(Icons.person, color: Colors.white),
//                         ),
//                       ],
//                     )),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _messageController,
//                     onSubmitted: (value) => _sendMessage(), // Kirim pesan dengan Enter
//                     decoration: InputDecoration(
//                       hintText: 'Send a message ...',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(24),
//                         borderSide: BorderSide.none,
//                       ),
//                       filled: true,
//                       fillColor: Colors.white,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 IconButton(
//                   icon: const Icon(Icons.send),
//                   onPressed: _sendMessage,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:finpro_11/ui/home.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages = []; // List untuk menyimpan pesan dan tipe (user/bot)
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
    if (userMessage.contains('sedih') || userMessage.contains('down')) {
      botResponse = "Tentu! Mungkin kamu bisa mencoba:\n"
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
      botResponse = "Senang mendengar itu! Tetap jaga energi positifmu dan sebarkan kebahagiaan ke sekitarmu! 😊🌟";
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
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Text to Text', style: TextStyle(color: Colors.black)),
            Text(
              'Ready',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
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
                        backgroundColor: Colors.green,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                    if (!isUser) const SizedBox(width: 8),
                    Flexible(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isUser ? Colors.white : Colors.lightBlueAccent,
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
                          style: TextStyle(
                              color: isUser ? Colors.black : Colors.white),
                        ),
                      ),
                    ),
                    if (isUser) const SizedBox(width: 8),
                    if (isUser)
                      const CircleAvatar(
                        backgroundColor: Colors.blueAccent,
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
