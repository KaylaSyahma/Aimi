import 'package:finpro_11/ui/auth/login_screen.dart';
import 'package:finpro_11/ui/auth/register_screen.dart';
import 'package:finpro_11/ui/chat/chat_screen.dart';
import 'package:finpro_11/ui/home.dart';
import 'package:finpro_11/ui/onBoarding/get_started.dart';
import 'package:finpro_11/ui/onBoarding/onBoarding_screen.dart';
import 'package:finpro_11/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Cuhk());
}

class Cuhk extends StatefulWidget {
  const Cuhk({super.key});

  @override
  State<Cuhk> createState() => _CuhkState();
}

class _CuhkState extends State<Cuhk> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        fontFamily: 'Urbanist', // Mengatur font global
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => const Home(),
        '/get-started' : (context) => const GetStarted(),
        '/on-boarding' : (context) => const OnboardingScreen(),
        '/signin' : (context) => const LoginScreen(),
        '/signup' : (context) => const RegisterScreen(),
        '/home' : (context) => const Home(),
        '/chat' : (context) => const ChatScreen(),
      },
    );
  }
}
