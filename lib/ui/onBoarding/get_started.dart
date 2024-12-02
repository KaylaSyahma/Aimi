import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFF7F4F2),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(image:  AssetImage('assets/icons/logo_circle.png')),
            const SizedBox(height: 16,),
            const Text("Welcome to the Aimi\nAI Therapist",
              style: TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16,),
            const Text("Your mindful mental health AI companion\nfor everyone anywhere",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32,),
            const Image(image: AssetImage('assets/images/get.png')),
            const SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 95),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/on-boarding');
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 12,),
                    Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white)
                  ],
                )
              ),
            ),
            const SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/signin');
                }, 
                  child: const Text("Sign In", style:  TextStyle(color: tertiaryColor),)
                )
              ],
            )
          ],
        )
      ),
    );
  }
}