import 'package:finpro_11/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:finpro_11/const.dart';

class ChatScreen extends StatefulWidget {
  //karna chat melibatkan perubahan data (pesan masuk/keluar), makanya pke stateful
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
  // menyimpan logika dan data yang dinamis (state) dari halaman.
  // buat ngatur isi yang bisa berubah, misal daftar pesan atau input teks.
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> _messages =
      []; // List untuk menyimpan pesan dan tipe (user/bot)
//  Tempat nyimpen semua pesan chat (dari user atau bot).
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage(String text) {
    if (text.trim().isNotEmpty) {
      // Cek dulu teksnya kosong/ga
      setState(() {
        //Ngasih tahu Flutter kalo ada data yang di-update, biar layar ikut berubah.
        //Masukin pesan ke daftar _message
        _messages.add({'sender': 'user', 'text': text.trim()});
        // sender itu siapa yang kirim, text itu isi pesannya.
// _messageController: Ngontrol teks yang ditulis di kolom input (biar bisa diambil atau dihapus).
      });
      _messageController.clear(); //kosongin inputan setelah dikirim

      // Periksa kata kunci untuk balasan otomatis
      _getAutoResponse(text
          .trim()); //text.trim buat Ngilangin spasi kosong di awal/akhir teks.
      // _getAutorespone buat manggil fungsi nyuruh kasih balasan otomatis
    }
  }

  void _getAutoResponse(String userMessage) {
    //Kata kunci buat nentuin bot jawab apa
    final responses = {
      'sedih':
          "Mengapa kamu sedih? Kalo kamu mau cerita, aku ada di sini kok...",
      'bingung': "Tidak apa-apa merasa bingung! Cobalah untuk...",
      'bahagia': "Senang mendengar itu! Tetap jaga energi positifmu...",
      'marah': "Aku mengerti kamu sedang marah. Cobalah...",
      'kesel':
          "Kekesalan itu wajar, tapi jangan dibiarkan berlarut-larut ya...",
      'mood':
          "Mood naik-turun memang bisa menyulitkan, tapi jangan khawatir!..."
    };

    for (final keyword in responses.keys) {
      if (userMessage.contains(keyword)) {
        Future.delayed(const Duration(seconds: 1), () {
          // ngasih jeda 1 detik biar kerasa realistis
          setState(() {
            _messages.add({'sender': 'bot', 'text': responses[keyword]!});
            // ini versi botnya, jadi sendernya bot, isi teks nya sesuai keyword user
          });
        });
        break;
      }
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
          //dikasih row Biar pesan user muncul di kanan dan bot di kiri.
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Text to Text',
                style: TextStyle(
                    color: primaryColor, fontWeight: FontWeight.w800)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                'Ready',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: primaryColor),
          onPressed: () {
            Navigator.of(context).pop(const Home());
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            // biar menuhin layar. klo ga pke ini nanti malah jadi kekecilan atau numpuk sama yang lain
            child: ListView(
              // komponen buat bikin list yang bisa di-scroll (geser atas-bawah).
              padding: const EdgeInsets.all(16.0),
              children: _messages.map((msg) {
                /* maksudnya setiap item di _messages bakal diolah jadi widget, lalu ditampilkan satu per satu
                contoh isinya 
  {'sender': 'user', 'text': 'Hai'},
  {'sender': 'bot', 'text': 'Halo juga!'}
Nanti tiap item (msg) diolah di .map() menjadi ewidget*/
// msg itu representasi satu item di list _messages. Misalnya ada 5 pesan, map ini bakal jalanin logikanya 5 kali, masing-masing untuk 1 item. contoh msg sender adalah user dan msg text adalah hai.
                final isUser = msg['sender'] == 'user';
                return Row(
                  mainAxisAlignment:
                      isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    if (!isUser)
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.android, color: secondaryColor),
                      ),
                    if (!isUser) const SizedBox(width: 8),
                    Flexible(
                      //buat bikin klo teks nya panjang, bakal pindah ke bawah. jadi ga nabrak kotaknya
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
                          // buat nampilin pesan ke layar, dikasih ! biar memastikan ga kosong (karna tipenya nullable)
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
                        backgroundColor: secondaryColor,
                        child: Icon(Icons.account_circle_rounded,
                            color: Colors.white),
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
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: tertiaryColor, // Warna border saat aktif (focus)
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide(
                          color: Colors.grey, // Warna border saat tidak aktif
                          width: 1.5,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: primaryColor,
                  ),
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
