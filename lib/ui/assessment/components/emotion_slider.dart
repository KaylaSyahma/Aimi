import 'package:finpro_11/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmotionSlider extends StatelessWidget {
  final int currentLevel; // Level yang sedang dipilih (0-4)

  // Constructor menerima level aktif
  const EmotionSlider({super.key, required this.currentLevel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildLevel("Excellent", Icons.schedule, "7-9 Hours", "assets/icons/Solid mood overjoyed.svg", isActive: currentLevel == 4),
        buildLevel("Good", Icons.schedule, "6-7 Hours","assets/icons/Solid mood happy.svg", isActive: currentLevel == 3),
        buildLevel("Fair", Icons.schedule, "5 Hours","assets/icons/Solid mood neutral.svg", isActive: currentLevel == 2),
        buildLevel("Poor", Icons.schedule, "3-4 Hours","assets/icons/Solid mood sad.svg", isActive: currentLevel == 1),
        buildLevel("Worst", Icons.schedule, "<3 Hours","assets/icons/Solid mood depressed.svg", isActive: currentLevel == 0),
      ],
    );
  }

  Widget buildLevel(String text, IconData icon, String subText, String svgPath, {bool isActive = false}) {
    return SizedBox(
      height: 70, // Tinggi setiap item
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Teks (di kiri)
          Positioned(
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              text,
              style: TextStyle(
                color: isActive ? primaryColor : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              ),
              SizedBox(height: 8,),
              Row(
                children: [
                  Icon(icon, color: isActive ? primaryColor : Colors.grey, size: 16,),
                  SizedBox(width: 5,),
                  Text(subText, style: TextStyle(
                color: isActive ? primaryColor : Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14
              )),
                ],
              )
            ],
            ),
          ),

          // Emoji (di kanan)
          Positioned(
            right: 0,
            child: AnimatedOpacity(
              opacity: isActive ? 1.0 : 0.5,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(
                svgPath,
                width: 50,
                height: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
