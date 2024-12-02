import 'package:finpro_11/ui/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState(); //nyimpen logika
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0; //nyimpen menu yang lagi aktif di bottom navabrr

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });

  switch (index) {
    //  cara gampang untuk ngecek menu mana yang dipilih dan lakuin aksi yang sesuai
    case 0:
      // Home Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()), 
      );
      break;

    case 1:
      // // Favorite Screen
      // Navigator.push(
      //   context,
      //   // MaterialPageRoute(builder: (context) => const FavoriteScreen()),
      // );
      // break;

    case 2:
      // Chat Screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ChatScreen()),
      );
      break;

    // case 3:
    //   // Device Screen
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const DeviceScreen()),
    //   );
    //   break;

    // case 4:
    //   // Flag Screen
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (context) => const FlagScreen()),
    //   );
    //   break;
  }
}


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
              // CrossAxAl itu untuk ngatur posisi element berdasar poros silang (Row jadi vertikal, Column jadi horizontal) jadi kayak tukeran aja sama mainAxAl
              children: [
                const SizedBox(height: 16),
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // MainAxal itu buat ngatur posisi berdasarkan poros utama
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(0, Icons.emoji_emotions, Colors.brown),
            
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(1, Icons.favorite, Colors.brown),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(2, Icons.face, Colors.brown),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(3, Icons.phone_android_rounded, Colors.brown),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(4, Icons.flag, Colors.brown),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(int index, IconData icon, Color color) {
    // _build icon itu function buat ngebikin icon di BottomNavigationBar. Kalau tabnya dipilih, iconnya bakal berubah warnanya jadi lebih terang
    bool isSelected = _selectedIndex == index;
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              shape: BoxShape.circle,
            )
          : null,
      padding: const EdgeInsets.all(8),
      child: Icon(
        icon,
        color: isSelected ? Colors.orange : color,
        size: 28,
      ),
    );
  }

  GestureDetector _cardOption(BuildContext context, String text, String image) {
    // metod card option adalah fungsi yang ngebikin card interaktif dengan gambar dan teks.
    //  buat nangkep aksi tap. Kalau salah satu card di-tap, layar bakal pindah ke ChatScreen
    return GestureDetector(
      onTap: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ChatScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFF9BB168),
            width: 1.5,
          ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
