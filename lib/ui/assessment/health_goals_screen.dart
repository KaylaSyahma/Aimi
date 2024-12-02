import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';

class HealthGoalsScreen extends StatefulWidget {
  const HealthGoalsScreen({super.key});

  @override
  State<HealthGoalsScreen> createState() => _HealthGoalsScreenState();
}

class _HealthGoalsScreenState extends State<HealthGoalsScreen> {
  final List<Map<String, dynamic>> pickerData = [
    {'label': 'I wanna reduce stress', 'isSelected': false, 'icon': Icons.spa},
    {'label': 'I wanna improve fitness', 'isSelected': false, 'icon': Icons.fitness_center},
    {'label': 'I wanna eat healthier', 'isSelected': false, 'icon': Icons.restaurant},
    {'label': 'I wanna sleep better', 'isSelected': false, 'icon': Icons.bed},
    {'label': 'I wanna meditate more', 'isSelected': false, 'icon': Icons.self_improvement},
  ];

  int? selectedPicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Container(
              width: 20.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 2,
                  color: primaryColor,
                ),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded, 
                color: primaryColor, 
                size: 15.0
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, "/signin");
          },
        ),
        title: const Text(
          "Assessment",
          style: TextStyle(
            fontSize: 20.0,
            color: primaryColor,
            fontWeight: FontWeight.w700,
            fontFamily: "Urbanist",
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const Text(
              "What’s your health goal?",
              style: TextStyle(
                fontSize: 30,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: pickerData.length,
                itemBuilder: (context, index) {
                  final item = pickerData[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        item['isSelected'] = !item['isSelected'];
                        selectedPicker = item['isSelected'] ? index : null;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: item['isSelected'] ? secondaryColor : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: item['isSelected'] ? const Color(0xFF9BB168).withOpacity(0.3) : Colors.transparent,
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Icon(
                              item['icon'],
                              color: item['isSelected'] ? Colors.white : textColor,
                              size: 24.0,
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          Expanded(
                            child: Text(
                              item['label'],
                              style: TextStyle(
                                color: item['isSelected'] ? Colors.white : primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Icon(
                            item['isSelected'] ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                            color: item['isSelected'] ? Colors.white : primaryColor,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Spacer to push the next button down
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Action for the next button
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 190),
          ],
        ),
      ),
    );
  }
}
