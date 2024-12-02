import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState(); //manggil itstate bawaan
    // nentuin durasi splash screen
    Future.delayed(const Duration(seconds: 5), () {
      //ini kayak kalo udh 3 detik bakal ke halaman berikutnya
      Navigator.pushReplacementNamed(
          //na ini, bakal di replace ke sini
          // ignore: use_build_context_synchronously
          context,
          '/get-started'); // Navigasi ke halaman utama
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/icons/Logomark.png')),
            SizedBox(
              height: 37,
            ),
            Text(
              "Aimi \nAI Therapist",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: primaryColor,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
