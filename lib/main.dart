import 'package:finpro_11/ui/chat/chat_screen.dart';
// import 'package:finpro_11/ui/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(
        fontFamily: 'Urbanist', // Mengatur font global
      ),
      home: const ChatScreen(),
    );
  }
}
