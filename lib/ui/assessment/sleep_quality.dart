import 'package:finpro_11/const.dart';
import 'package:finpro_11/ui/assessment/components/emotion_slider.dart';
import 'package:flutter/material.dart';

class SleepQuality extends StatefulWidget {
  const SleepQuality({super.key});

  @override
  State<SleepQuality> createState() => _SleepQualityState();
}

class _SleepQualityState extends State<SleepQuality> {
  double sliderValue = 0; // Nilai slider (0-4)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        elevation: 0,
        title: const Text(
          "Assessment",
          style: TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.center,
                "How would you rate your sleep quality?",
                style: TextStyle(
                  fontSize: 30,
                  color: primaryColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 40), // Spasi antara teks dan slider
              Center(
                child: SizedBox(
                  height: 480, // Atur tinggi slider dan komponennya
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // round untuk ngebulatin nilai dri slidervalue
                      EmotionSlider(currentLevel: sliderValue.round()),

                      // Slider Vertikal
                      Positioned(
                        // dibagi dua buat ditengah layar, dikasih -35 biar agar ke kiri
                        left: MediaQuery.of(context).size.width / 2 -35, // Posisikan slider di tengah
                        top: 0,
                        bottom: 0,
                        child: RotatedBox(
                          quarterTurns: 3, // Rotasi slider jadi vertikal
                          child: SliderTheme(
                            // copywith = untuk menyesuaikan sesuai desain sementara ttp pake default dri flutter
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 15
                            ),
                            child: Slider(
                              value: sliderValue,
                              min: 0,
                              max: 4,
                              divisions: 4,
                              activeColor: Colors.orange,
                              inactiveColor: Colors.grey[300],
                              onChanged: (value) {
                                setState(() {
                                  sliderValue = value; // Update posisi slider
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 70,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
              ),
                onPressed: (){
                  Navigator.pushReplacementNamed(context, '/home');
                }, 
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Next", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 12,),
                    Icon(Icons.arrow_forward_ios, size: 18, color: Colors.white)
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
