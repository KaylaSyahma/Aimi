import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';

class HealthGoalsScreen extends StatefulWidget {
  const HealthGoalsScreen({super.key});

  @override
  State<HealthGoalsScreen> createState() => _HealthGoalsScreenState();
}

class _HealthGoalsScreenState extends State<HealthGoalsScreen> {
  int? selectedPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(8),
            width: 20.0,
            height: 20.0,
            color: Colors.transparent,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: primaryColor
              )
            )
          ),
          onTap: ()  {
            Navigator.pushNamed(context, "/signin");
          },
        ),
        title: const Text(
          "Assessment",
          style: TextStyle(
            fontSize: 18.0,
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: "Urbanist"
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            const Text(
              "What’s your health goal?",
              style: TextStyle(
                fontSize: 40,
                color: primaryColor,
                fontWeight: FontWeight.w800
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate(6, (index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Warna background button
                    side: BorderSide(
                      color: selectedPicker == index
                          ? Colors.blue
                          : Colors.grey, // Border berubah jika dipilih
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedPicker = index; // Simpan pilihan
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Picker ${index + 1}"), // Teks button
                      Container(
                        width: 20, // Lebar oval
                        height: 20, // Tinggi oval
                        decoration: BoxDecoration(
                          color: selectedPicker == index
                              ? Colors.blue
                              : Colors.transparent, // Warna jika dipilih
                          border: Border.all(
                            color: Colors.blue,
                            width: 2, // Ketebalan border
                          ),
                          shape: BoxShape.circle, // Bentuk oval
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
            const Spacer(), // Spacer untuk dorong ke bawah

            // Tombol Next
            ElevatedButton(
              onPressed: selectedPicker != null
                  ? () {
                      Navigator.pushNamed(context, '/nextScreen'); // Navigasi ke screen berikutnya
                    }
                  : null, // Tombol nonaktif jika belum dipilih
              child: const Text("Next"), // Teks button
            )
          ],
        ),
      ),
    );
  }
}